import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  static const String _apiKey = 'AIzaSyAepTm-do_V8CYr6pimtB5wMj48ZwNZqhU';

  final _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: _apiKey,
  );

  @override
  Future<String> getGeminiResponse(String userQuestion) async {
    try {
      final prompt = '''
أنت مساعد طبي متخصص في صحة الأطفال. يجب أن تكون إجاباتك:
1. دقيقة ومبنية على معلومات طبية موثوقة
2. واضحة وسهلة الفهم
3. مفيدة ومطمئنة
4. باللغة العربية
5. مناسبة للوالدين

السؤال: $userQuestion

ملاحظة: في نهاية كل إجابة، أضف إخلاء المسؤولية التالي:
"هذه المعلومات للإرشاد فقط ولا تغني عن استشارة الطبيب."
''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      return response.text ??
          'عذراً، لم أتمكن من معالجة طلبك. يرجى المحاولة مرة أخرى.';
    } catch (e) {
      debugPrint('Error in getGeminiResponse: $e');
      return 'حدث خطأ في الاتصال. يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى.';
    }
  }
}
