import 'artcile_data.dart';
import 'artcile_model.dart';

class ArticleResponse {
  final bool? success;
  final ArticleData? data;

  const ArticleResponse({
    this.success,
    this.data,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? ArticleData.fromJson(json['data']) : null,
    );
  }
}



