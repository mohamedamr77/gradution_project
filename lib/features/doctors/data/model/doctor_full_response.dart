import 'doctor_response.dart';

class DoctorFullResponse {
  final bool? success;
  final DoctorsResponseModel? data;

  const DoctorFullResponse({
    this.success,
    this.data,
  });

  factory DoctorFullResponse.fromJson(Map<String, dynamic> json) {
    return DoctorFullResponse(
      success: json['success'] as bool?,
      data: json['data'] != null
          ? DoctorsResponseModel.fromJson(json['data'])
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
