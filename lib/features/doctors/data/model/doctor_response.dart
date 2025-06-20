import 'doctor_model.dart';

class DoctorsResponseModel {
  final List<DoctorModel>? rows;
  final int? rowCount;

  const DoctorsResponseModel({
    this.rows,
    this.rowCount,
  });

  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) {
    return DoctorsResponseModel(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rowCount: json['rowCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rows': rows?.map((e) => e.toJson()).toList(),
      'rowCount': rowCount,
    };
  }
}
