import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/gemini_health_cubit.dart';
import '../../view_model/gemini_health_state.dart';
import '../../../data/model/chat_message.dart';

class GeminiHealthBody extends StatelessWidget {
  const GeminiHealthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiHealthCubit, GeminiHealthState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: _buildMessagesList(context, state),
            ),
            _buildInputField(context),
          ],
        );
      },
    );
  }

  Widget _buildMessagesList(BuildContext context, GeminiHealthState state) {
    if (state is GeminiHealthInitial) {
      return const Center(
        child: Text(
          'مرحباً بك في المساعد الطبي للأطفال\nيمكنك طرح أسئلتك هنا',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    if (state is GeminiHealthLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is GeminiHealthError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<GeminiHealthCubit>().clearChat(),
              child: const Text('إعادة المحادثة'),
            ),
          ],
        ),
      );
    }

    if (state is GeminiHealthLoaded) {
      return ListView.builder(
        reverse: true,
        padding: const EdgeInsets.all(16),
        itemCount: state.messages.length,
        itemBuilder: (context, index) {
          final message = state.messages[state.messages.length - 1 - index];
          return _buildMessageBubble(message);
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue[100] : Colors.green[100],
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: const BoxConstraints(maxWidth: 300),
        child: Text(
          message.text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    final cubit = context.read<GeminiHealthCubit>();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: cubit.questionController,
              decoration: const InputDecoration(
                hintText: 'اكتب سؤالك هنا...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => cubit.askQuestion(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: cubit.askQuestion,
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
