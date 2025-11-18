import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class TwkFile extends Equatable {
  final String type;
  final String mimeType;
  final String data;
  final String fileName;
  final Uint8List binary;

  const TwkFile._({
    required this.type,
    required this.mimeType,
    required this.data,
    required this.fileName,
    required this.binary,
  });
  static Future<TwkFile> fromBase64String({
    required String type,
    required String mimeType,
    required String base64String,
    required String fileName,
  }) async {
    var cleanBase64String = base64String;
    // Remove data URI prefix if present (e.g., "data:image/jpeg;base64,")
    if (cleanBase64String.startsWith('data:')) {
      final commaIndex = cleanBase64String.indexOf(',');
      if (commaIndex != -1) {
        cleanBase64String = cleanBase64String.substring(commaIndex + 1);
      }
    }
    final binaryData = await compute(base64Decode, cleanBase64String);
    return TwkFile._(
      type: type,
      mimeType: mimeType,
      data: cleanBase64String,
      fileName: fileName,
      binary: binaryData,
    );
  }

  static Future<TwkFile> fromJson(Map<String, dynamic> map) async {
    var base64Data = map['data'] as String;
    // Remove data URI prefix if present (e.g., "data:image/jpeg;base64,")
    if (base64Data.startsWith('data:')) {
      final commaIndex = base64Data.indexOf(',');
      if (commaIndex != -1) {
        base64Data = base64Data.substring(commaIndex + 1);
      }
    }
    final binaryData = await compute(base64Decode, base64Data);
    return TwkFile._(
      type: map['type'] as String,
      mimeType: map['mime_type'] as String,
      data: base64Data,
      fileName: map['file_name'] as String,
      binary: binaryData,
    );
  }

  @override
  List<Object?> get props => [type, mimeType, data, fileName];
}
