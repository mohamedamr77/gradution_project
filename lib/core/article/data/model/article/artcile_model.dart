class ArticleModel {
  final String? id;
  final String? title;
  final String? content;
  final List<String>? author;
  final DateTime? publicationDate;
  final List<String>? tags;
  final String? category;
  final String? status;
  final int? views;
  final List<String>? references;
  final bool? isFeatured;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ArticleModel({
    this.id,
    this.title,
    this.content,
    this.author,
    this.publicationDate,
    this.tags,
    this.category,
    this.status,
    this.views,
    this.references,
    this.isFeatured,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      author: (json['author'] as List<dynamic>?)?.cast<String>(),
      publicationDate: json['publicationDate'] != null
          ? DateTime.tryParse(json['publicationDate'])
          : null,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
      category: json['category'] as String?,
      status: json['status'] as String?,
      views: json['views'] as int?,
      references: (json['references'] as List<dynamic>?)?.cast<String>(),
      isFeatured: json['isFeatured'] as bool?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }
}