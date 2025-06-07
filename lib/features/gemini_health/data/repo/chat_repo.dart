import 'package:google_generative_ai/google_generative_ai.dart';

class ChatRepository {
  // قم بوضع مفتاح الـ API الخاص بك هنا
  // الأفضل: لا تضعه مباشرة في الكود، استخدم متغيرات البيئة (environment variables) لحمايته
  static const String _apiKey = 'AIzaSyAepTm-do_V8CYr6pimtB5wMj48ZwNZqhU';

  final _model = GenerativeModel(
    model: 'gemini-1.5-flash', // اختر الموديل المناسب
    apiKey: _apiKey,
  );

  Future<String> getGeminiResponse(String userQuestion) async {
    try {
      // **هندسة الأوامر (Prompt Engineering)**
      // قم بإضافة تعليمات للنظام قبل سؤال المستخدم لتحسين جودة الرد
      final prompt =
          'أجب بصفتك مساعدًا طبيًا متخصصًا في صحة الأطفال. يجب أن تكون إجاباتك مفيدة ومطمئنة باللغة العربية. في نهاية كل إجابة، أضف إخلاء المسؤولية التالي: "هذه المعلومات للإرشاد فقط ولا تغني عن استشارة الطبيب."\n\nالسؤال: $userQuestion';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      return response.text ?? 'عفوًا، لم أتمكن من معالجة طلبك.';
    } catch (e) {
      // تعامل مع الأخطاء مثل عدم وجود انترنت أو خطأ في الـ API
      return 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
    }
  }
}