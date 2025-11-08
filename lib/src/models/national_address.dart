class NationalAddress {
  final Details details;
  final Summary summary;
  final bool isPrimaryAddress;

  NationalAddress({
    required this.details,
    required this.summary,
    required this.isPrimaryAddress,
  });

  factory NationalAddress.fromJson(Map<String, dynamic> json) => NationalAddress(
        details: Details.fromJson(json['details']),
        summary: Summary.fromJson(json['summary']),
        isPrimaryAddress: json['is_primary_address'],
      );
}

class Details {
  final String additionalNo;
  final String buildingNo;
  final String city;
  final String districtName;
  final String sectionType;
  final String shortAddress;
  final String streetName;
  final String zipCode;

  Details({
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
}

class Summary {
  final String addressCounter;
  final String sectionType;
  final String addressEn;
  final String addressAr;
  final double latitude;
  final double longitude;

  Summary({
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
}
