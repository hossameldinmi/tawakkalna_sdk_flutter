import 'package:equatable/equatable.dart';

/// Represents a traffic violation in Saudi Arabia.
///
/// Contains comprehensive information about traffic violations including
/// vehicle details, violation specifics, fine amount, and payment status.
///
/// Example:
/// ```dart
/// // Get unpaid violations
/// final violations = await twk.getUserUnPaidViolations();
/// for (var violation in violations) {
///   print('Violation: ${violation.violationType}');
///   print('Fine: ${violation.totalFineAmount} SAR');
///   print('Status: ${violation.violationStatus}');
/// }
/// ```
class Violation extends Equatable {
  /// The vehicle manufacturer/brand
  final String manufacturer;

  /// The vehicle's license plate number
  final String plateNumber;

  /// The speed limit of the street where the violation occurred
  final String streetSpeed;

  /// The total fine amount in SAR (Saudi Riyals)
  final String totalFineAmount;

  /// The vehicle model
  final String vehicleModel;

  /// The vehicle's speed at the time of violation
  final String vehicleSpeed;

  /// The type/category of the vehicle
  final String vehicleType;

  /// The city where the violation occurred
  final String violationCity;

  /// The date and time when the violation occurred
  final String violationDateTime;

  /// Unique violation identifier/number
  final String violationNumber;

  /// Current payment status of the violation
  final String violationStatus;

  /// The type/category of the violation (e.g., speeding, parking)
  final String violationType;

  /// Creates a new Violation instance.
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
