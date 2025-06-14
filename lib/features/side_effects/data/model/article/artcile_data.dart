import 'artcile_model.dart';

class ArticleData {
  final List<ArticleModel>? rows;
  final int? rowCount;

  const ArticleData({
    this.rows,
    this.rowCount,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    return ArticleData(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e))
          .toList(),
      rowCount: json['rowCount'] as int?,
    );
  }
}
