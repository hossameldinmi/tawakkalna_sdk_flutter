import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String plateNumber;
  final String registrationType;
  final String majorColor;
  final String model;
  final String status;
  final String modelYear;
  final String identificationNumber;
  final String serialNumber;
  final String loadCapacity;
  final String weight;
  final String registrationExpiryDate;
  final String manufacturer;

  const Vehicle({
    required this.plateNumber,
    required this.registrationType,
    required this.majorColor,
    required this.model,
    required this.status,
    required this.modelYear,
    required this.identificationNumber,
    required this.serialNumber,
    required this.loadCapacity,
    required this.weight,
    required this.registrationExpiryDate,
    required this.manufacturer,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      plateNumber: json['plate_number'] as String,
      registrationType: json['registration_type'] as String,
      majorColor: json['major_color'] as String,
      model: json['model'] as String,
      status: json['status'] as String,
      modelYear: json['model_year'] as String,
      identificationNumber: json['identification_number'] as String,
      serialNumber: json['serial_number'] as String,
      loadCapacity: json['load_capacity'] as String,
      weight: json['weight'] as String,
      registrationExpiryDate: json['registration_expiry_date'] as String,
      manufacturer: json['manufacturer'] as String,
    );
  }

  @override
  List<Object?> get props => [
        plateNumber,
        registrationType,
        majorColor,
        model,
        status,
        modelYear,
        identificationNumber,
        serialNumber,
        loadCapacity,
        weight,
        registrationExpiryDate,
        manufacturer,
      ];
}
