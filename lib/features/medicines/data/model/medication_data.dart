import 'medication_model.dart';

class MedicationData {
  final List<MedicationModel>? rows;
  final int? rowCount;

  MedicationData({this.rows, this.rowCount});

  factory MedicationData.fromJson(Map<String, dynamic> json) {
    return MedicationData(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((item) => MedicationModel.fromJson(item))
          .toList(),
      rowCount: json['rowCount'],
    );
  }
}