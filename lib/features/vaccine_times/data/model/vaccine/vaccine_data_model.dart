import 'package:gradutionproject/features/vaccine_times/data/model/vaccine/vaccine_model.dart';

class VaccineDataModel {
  final List<VaccineModel>? rows;
  final int? rowCount;

  const VaccineDataModel({
    this.rows,
    this.rowCount,
  });

  factory VaccineDataModel.fromJson(Map<String, dynamic> json) {
    return VaccineDataModel(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => VaccineModel.fromJson(e as Map<String, dynamic>))
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