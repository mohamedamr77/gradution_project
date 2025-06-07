import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_font_family.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/model/chat_message.dart';
import '../../view_model/gemini_health_cubit.dart';
import '../../view_model/gemini_health_state.dart';

class GeminiHealthBody extends StatelessWidget {
  const GeminiHealthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiHealthCubit, GeminiHealthState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[50],
                child: _buildMessagesList(context, state),
              ),
            ),
            _buildInputField(context),
          ],
        );
      },
    );
  }

  Widget _buildMessagesList(BuildContext context, GeminiHealthState state) {
    if (state is GeminiHealthInitial) {
      return Center(
        child: Text(
          LocaleKeys.welcome_message.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFontFamily.cairoFontFamily,
            fontSize: 20,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    if (state is GeminiHealthLoading) {
      return ListView.builder(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: context.read<GeminiHealthCubit>().messages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildTypingIndicator();
          }
          final message = context
              .read<GeminiHealthCubit>()
              .messages[context.read<GeminiHealthCubit>().messages.length - index];
          return _buildMessageBubble(message, context);
        },
      );
    }

    if (state is GeminiHealthError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: TextStyle(
                fontFamily: AppFontFamily.cairoFontFamily,
                fontSize: 16,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<GeminiHealthCubit>().clearChat(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3640CE),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                LocaleKeys.reset_chat_button.tr(),
                style: const TextStyle(
                    fontFamily: AppFontFamily.cairoFontFamily, fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }

    if (state is GeminiHealthLoaded) {
      return ListView.builder(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: state.messages.length,
        itemBuilder: (context, index) {
          final message = state.messages[state.messages.length - 1 - index];
          return _buildMessageBubble(message, context);
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedTypingIndicator(),
    );
  }

  Widget _buildMessageBubble(ChatMessage message, BuildContext context) {
    final isUser = message.isUser;
    return AnimatedMessageBubble(
      message: message,
      isUser: isUser,
    );
  }

  Widget _buildInputField(BuildContext context) {
    final cubit = context.read<GeminiHealthCubit>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: cubit.questionController,
              decoration: InputDecoration(
                hintText: LocaleKeys.text_field_hint.tr(),
                hintStyle: TextStyle(
                    fontFamily: AppFontFamily.cairoFontFamily,
                    color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xff3640CE),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => cubit.askQuestion(),
              style: TextStyle(
                  fontFamily: AppFontFamily.cairoFontFamily, fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          AnimatedSendButton(
            onTap: cubit.askQuestion,
          ),
        ],
      ),
    );
  }
}

// New widget for animated message bubble
class AnimatedMessageBubble extends StatefulWidget {
  final ChatMessage message;
  final bool isUser;

  const AnimatedMessageBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  _AnimatedMessageBubbleState createState() => _AnimatedMessageBubbleState();
}

class _AnimatedMessageBubbleState extends State<AnimatedMessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(widget.isUser ? -0.2 : 0.2, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Align(
          alignment: widget.isUser ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.isUser
                    ? [Colors.white, Colors.grey[50]!]
                    : [const Color(0xff3640CE), const Color(0xff4854E0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: widget.isUser
                    ? const Radius.circular(4)
                    : const Radius.circular(16),
                bottomRight: widget.isUser
                    ? const Radius.circular(16)
                    : const Radius.circular(4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              widget.message.text,
              style: TextStyle(
                fontFamily: AppFontFamily.cairoFontFamily,
                fontSize: 16,
                color: widget.isUser ? Colors.black87 : Colors.white,
                fontWeight: widget.isUser ? FontWeight.normal : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// New widget for animated typing indicator
class AnimatedTypingIndicator extends StatefulWidget {
  const AnimatedTypingIndicator({super.key});

  @override
  _AnimatedTypingIndicatorState createState() => _AnimatedTypingIndicatorState();
}

class _AnimatedTypingIndicatorState extends State<AnimatedTypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          constraints: const BoxConstraints(maxWidth: 200),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.typing_indicator.tr(),
                style: TextStyle(
                  fontFamily: AppFontFamily.cairoFontFamily,
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff3640CE)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New widget for animated send button
class AnimatedSendButton extends StatefulWidget {
  final VoidCallback onTap;

  const AnimatedSendButton({super.key, required this.onTap});

  @override
  _AnimatedSendButtonState createState() => _AnimatedSendButtonState();
}

class _AnimatedSendButtonState extends State<AnimatedSendButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: const Color(0xff3640CE),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.send,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}