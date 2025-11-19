import 'package:equatable/equatable.dart';

/// Represents a registered vehicle with all its details.
///
/// Contains comprehensive information about a vehicle including
/// registration details, physical characteristics, and expiry dates.
/// This data is typically retrieved from Saudi traffic authorities.
///
/// Example:
/// ```dart
/// final vehicles = await twk.getUserVehicles();
/// for (var vehicle in vehicles) {
///   print('${vehicle.manufacturer} ${vehicle.model} - ${vehicle.plateNumber}');
/// }
/// ```
class Vehicle extends Equatable {
  /// The vehicle's license plate number
  final String plateNumber;

  /// The type of registration (e.g., private, commercial)
  final String registrationType;

  /// The primary color of the vehicle
  final String majorColor;

  /// The vehicle model name
  final String model;

  /// Current registration status (e.g., active, expired)
  final String status;

  /// The manufacturing year of the vehicle
  final String modelYear;

  /// Vehicle Identification Number (VIN)
  final String identificationNumber;

  /// The vehicle's serial number
  final String serialNumber;

  /// Maximum load capacity in relevant units
  final String loadCapacity;

  /// The vehicle's weight
  final String weight;

  /// Date when the registration expires
  final String registrationExpiryDate;

  /// The vehicle manufacturer/brand name
  final String manufacturer;

  /// Creates a new Vehicle instance.
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
