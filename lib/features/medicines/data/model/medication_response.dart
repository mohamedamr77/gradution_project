import 'medication_data.dart';

class MedicationResponse {
  final bool? success;
  final MedicationData? data;

  MedicationResponse({this.success, this.data});

  factory MedicationResponse.fromJson(Map<String, dynamic> json) {
    return MedicationResponse(
      success: json['success'],
      data: json['data'] != null ? MedicationData.fromJson(json['data']) : null,
    );
  }
}



class Medication {
  final String? id;
  final String? name;
  final String? description;
  final String? dosage;
  final String? manufacturer;
  final double? price;
  final String? category;
  final bool? prescriptionRequired;
  final List<String>? sideEffects;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Medication({
    this.id,
    this.name,
    this.description,
    this.dosage,
    this.manufacturer,
    this.price,
    this.category,
    this.prescriptionRequired,
    this.sideEffects,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dosage: json['dosage'],
      manufacturer: json['manufacturer'],
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'],
      prescriptionRequired: json['prescriptionRequired'],
      sideEffects: (json['sideEffects'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      image: json['image'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }
}
