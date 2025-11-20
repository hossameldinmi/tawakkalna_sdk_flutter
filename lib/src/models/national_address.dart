import 'package:equatable/equatable.dart';

/// Represents a Saudi Arabian national address.
///
/// The Saudi national addressing system provides a standardized way to
/// identify locations. Each address has detailed components and a summary.
///
/// Example:
/// ```dart
/// final addresses = await twk.getUserNationalAddress();
/// for (var address in addresses) {
///   print('${address.summary.addressEn}');
///   if (address.isPrimaryAddress) {
///     print('This is the primary address');
///   }
/// }
/// ```
class NationalAddress extends Equatable {
  /// Detailed components of the address
  final Details details;

  /// Summary and coordinates of the address
  final Summary summary;

  /// Whether this is the user's primary address
  final bool isPrimaryAddress;

  /// Creates a new NationalAddress instance.
  const NationalAddress({
    required this.details,
    required this.summary,
    required this.isPrimaryAddress,
  });

  factory NationalAddress.fromJson(Map<String, dynamic> json) => NationalAddress(
        details: Details.fromJson((json['details'] as Map).cast()),
        summary: Summary.fromJson((json['summary'] as Map).cast()),
        isPrimaryAddress: json['is_primary_address'],
      );

  @override
  List<Object?> get props => [details, summary, isPrimaryAddress];
}

/// Detailed components of a national address.
///
/// Contains all the individual fields that make up a Saudi national address.
class Details extends Equatable {
  /// Additional number (secondary identifier)
  final String additionalNo;

  /// Building number
  final String buildingNo;

  /// City name
  final String city;

  /// District/neighborhood name
  final String districtName;

  /// Type of section (residential, commercial, etc.)
  final String sectionType;

  /// Short formatted address
  final String shortAddress;

  /// Street name
  final String streetName;

  /// Postal/ZIP code
  final String zipCode;

  /// Creates a new Details instance.
  const Details({
    required this.additionalNo,
    required this.buildingNo,
    required this.city,
    required this.districtName,
    required this.sectionType,
    required this.shortAddress,
    required this.streetName,
    required this.zipCode,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        additionalNo: json['additional_no'],
        buildingNo: json['building_no'],
        city: json['city'],
        districtName: json['district_name'],
        sectionType: json['section_type'],
        shortAddress: json['short_address'],
        streetName: json['street_name'],
        zipCode: json['zip_code'],
      );
  @override
  List<Object?> get props => [
        additionalNo,
        buildingNo,
        city,
        districtName,
        sectionType,
        shortAddress,
        streetName,
        zipCode,
      ];
}

/// Summary of a national address with coordinates.
///
/// Provides a condensed view of the address with bilingual text and GPS coordinates.
class Summary extends Equatable {
  /// Address counter/identifier
  final String addressCounter;

  /// Type of section (residential, commercial, etc.)
  final String sectionType;

  /// Full address in English
  final String addressEn;

  /// Full address in Arabic
  final String addressAr;

  /// GPS latitude coordinate
  final double latitude;

  /// GPS longitude coordinate
  final double longitude;

  /// Creates a new Summary instance.
  const Summary({
    required this.addressCounter,
    required this.sectionType,
    required this.addressEn,
    required this.addressAr,
    required this.latitude,
    required this.longitude,
  });
  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        addressCounter: json['address_counter'],
        sectionType: json['section_type'],
        addressEn: json['address_en'],
        addressAr: json['address_ar'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  @override
  List<Object?> get props => [
        addressCounter,
        sectionType,
        addressEn,
        addressAr,
        latitude,
        longitude,
      ];
}
