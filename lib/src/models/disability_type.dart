import 'package:equatable/equatable.dart';

/// Represents a disability type with a code and status.
///
/// This model is used throughout the SDK to represent disability types
/// with their associated codes and status values.
///
/// Example:
/// ```dart
/// final name = DisabilityType(
///   code: 1000006,
///   status: 401,
/// ```
class DisabilityType extends Equatable {
  /// The full name in Arabic
  final int code;

  /// The full name in English
  final int status;

  /// Creates a new DisabilityType instance.
  ///
  /// Both [code] and [status] are required to ensure bilingual support.
  const DisabilityType({
    required this.code,
    required this.status,
  });

  /// Creates a DisabilityType from a JSON map.
  ///
  /// Expects the JSON to have 'code' and 'status' keys.
  factory DisabilityType.fromJson(Map<String, dynamic> json) => DisabilityType(
        code: json['code'] as int,
        status: json['status'] as int,
      );

  @override
  List<Object?> get props => [code, status];
}
