import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/model/chat_message.dart';
import '../../data/repo/chat_repo.dart';
import 'gemini_health_state.dart';

class GeminiHealthCubit extends Cubit<GeminiHealthState> {
  final ChatRepository _chatRepository;
  final TextEditingController questionController = TextEditingController();
  final List<ChatMessage> messages = [];

  GeminiHealthCubit(this._chatRepository) : super(GeminiHealthInitial());

  Future<void> askQuestion() async {
    final question = questionController.text.trim();
    if (question.isEmpty) return;

    // Add user message
    final userMessage = ChatMessage(text: question, isUser: true);
    messages.add(userMessage);
    emit(GeminiHealthLoaded(List.from(messages)));

    // Show loading state while keeping messages visible
    emit(GeminiHealthLoading());
    questionController.clear();

    try {
      // Get response from Gemini
      final response = await _chatRepository.getGeminiResponse(question);

      // Add bot message
      final botMessage = ChatMessage(text: response, isUser: false);
      messages.add(botMessage);

      // Update UI with new messages
      emit(GeminiHealthLoaded(List.from(messages)));
    } catch (e) {
      emit(GeminiHealthError(
          'حدث خطأ أثناء التواصل مع المساعد الطبي. الرجاء المحاولة مرة أخرى.'));
    }
  }

  void clearChat() {
    messages.clear();
    emit(GeminiHealthInitial());
  }

  @override
  Future<void> close() {
    questionController.dispose();
    return super.close();
  }
}
