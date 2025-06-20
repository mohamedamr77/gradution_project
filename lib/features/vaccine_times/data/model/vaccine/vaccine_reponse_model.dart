import 'package:gradutionproject/features/vaccine_times/data/model/vaccine/vaccine_data_model.dart';

class VaccineResponseModel {
  final bool? success;
  final VaccineDataModel? data;

  const VaccineResponseModel({
    this.success,
    this.data,
  });

  factory VaccineResponseModel.fromJson(Map<String, dynamic> json) {
    return VaccineResponseModel(
      success: json['success'] as bool?,
      data: json['data'] != null
          ? VaccineDataModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}


