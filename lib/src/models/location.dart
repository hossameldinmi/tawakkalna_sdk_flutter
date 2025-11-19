import 'package:equatable/equatable.dart';

/// Represents a geographic location using latitude and longitude coordinates.
///
/// Used for location-based features in the Tawakkalna app.
///
/// Example:
/// ```dart
/// final location = await twk.getUserLocation();
/// if (location != null) {
///   print('User location: ${location.latitude}, ${location.longitude}');
/// }
/// ```
class Location extends Equatable {
  /// The latitude coordinate (north-south position)
  final double latitude;

  /// The longitude coordinate (east-west position)
  final double longitude;

  /// Creates a new Location instance.
  ///
  /// Parameters:
  /// - [latitude]: The latitude coordinate
  /// - [longitude]: The longitude coordinate
  const Location({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}
