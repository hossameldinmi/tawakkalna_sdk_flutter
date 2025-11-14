import 'package:equatable/equatable.dart';

class Violation extends Equatable {
  final String manufacturer;
  final String plateNumber;
  final String streetSpeed;
  final String totalFineAmount;
  final String vehicleModel;
  final String vehicleSpeed;
  final String vehicleType;
  final String violationCity;
  final String violationDateTime;
  final String violationNumber;
  final String violationStatus;
  final String violationType;

  const Violation({
    required this.manufacturer,
    required this.plateNumber,
    required this.streetSpeed,
    required this.totalFineAmount,
    required this.vehicleModel,
    required this.vehicleSpeed,
    required this.vehicleType,
    required this.violationCity,
    required this.violationDateTime,
    required this.violationNumber,
    required this.violationStatus,
    required this.violationType,
  });

  factory Violation.fromJson(Map<String, dynamic> json) {
    return Violation(
      manufacturer: json['manufacturer'] as String,
      plateNumber: json['plate_number'] as String,
      streetSpeed: json['street_speed'] as String,
      totalFineAmount: json['total_fine_amount'] as String,
      vehicleModel: json['vehicle_model'] as String,
      vehicleSpeed: json['vehicle_speed'] as String,
      vehicleType: json['vehicle_type'] as String,
      violationCity: json['violation_city'] as String,
      violationDateTime: json['violation_date_time'] as String,
      violationNumber: json['violation_number'] as String,
      violationStatus: json['violation_status'] as String,
      violationType: json['violation_type'] as String,
    );
  }

  @override
  List<Object?> get props => [
        manufacturer,
        plateNumber,
        streetSpeed,
        totalFineAmount,
        vehicleModel,
        vehicleSpeed,
        vehicleType,
        violationCity,
        violationDateTime,
        violationNumber,
        violationStatus,
        violationType,
      ];
}
