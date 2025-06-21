class ChildResponse {
  final bool? success;
  final ChildData? data;

  const ChildResponse({this.success, this.data});

  factory ChildResponse.fromJson(Map<String, dynamic> json) {
    return ChildResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? ChildData.fromJson(json['data']) : null,
    );
  }
}

class ChildData {
  final List<ChildRow>? rows;
  final int? rowCount;

  const ChildData({this.rows, this.rowCount});

  factory ChildData.fromJson(Map<String, dynamic> json) {
    return ChildData(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => ChildRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      rowCount: json['rowCount'] as int?,
    );
  }
}

class ChildRow {
  final int? childId;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  final String? dateOfBirth;
  final String? gender;
  final num? weight;
  final num? height;
  final String? createdAt;

  const ChildRow({
    this.childId,
    this.userId,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.dateOfBirth,
    this.gender,
    this.weight,
    this.height,
    this.createdAt,
  });

  factory ChildRow.fromJson(Map<String, dynamic> json) {
    return ChildRow(
      childId: json['child_id'] as int?,
      userId: json['user_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      imageUrl: json['image_url'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      createdAt: json['created_at'] as String?,
    );
  }
}
