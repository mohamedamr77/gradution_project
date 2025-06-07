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
                    fontFamily: AppFontFamily.cairoFontFamily,
                    fontSize: 16),
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
    );
  }

  Widget _buildMessageBubble(ChatMessage message , BuildContext context){
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isUser
                ? [Colors.white, Colors.grey[50]!]
                : [const Color(0xff3640CE), const Color(0xff4854E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser ? const Radius.circular(4) : const Radius.circular(16),
            bottomRight: isUser ? const Radius.circular(16) : const Radius.circular(4),
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
          message.text,
          style: TextStyle(
            fontFamily: AppFontFamily.cairoFontFamily,
            fontSize: 16,
            color: isUser ? Colors.black87 : Colors.white,
            fontWeight: isUser ? FontWeight.normal : FontWeight.w500,
          ),
        ),
      ),
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
                  fontFamily: AppFontFamily.cairoFontFamily,
                  fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: const Color(0xff3640CE),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: cubit.askQuestion,
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
        ],
      ),
    );
  }
}