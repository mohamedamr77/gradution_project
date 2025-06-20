import 'package:equatable/equatable.dart';
import '../../data/model/chat_message.dart';

abstract class GeminiHealthState extends Equatable {
  const GeminiHealthState();

  @override
  List<Object> get props => [];
}

class GeminiHealthInitial extends GeminiHealthState {}

class GeminiHealthLoading extends GeminiHealthState {}

class GeminiHealthLoaded extends GeminiHealthState {
  final List<ChatMessage> messages;

  const GeminiHealthLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class GeminiHealthError extends GeminiHealthState {
  final String message;

  const GeminiHealthError(this.message);

  @override
  List<Object> get props => [message];
}
