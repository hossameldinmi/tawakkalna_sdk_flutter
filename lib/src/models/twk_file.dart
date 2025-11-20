import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Represents a file (image, video, document) from the Tawakkalna SDK.
///
/// This model handles both base64-encoded file data and its binary representation.
/// Files can be obtained from camera, gallery, or file picker methods.
///
/// Example:
/// ```dart
/// final photo = await twk.getCameraPhoto();
/// if (photo != null) {
///   print('File: ${photo.fileName}');
///   print('Type: ${photo.mimeType}');
///   // Use photo.binary for raw bytes
///   // Use photo.data for base64 string
/// }
/// ```
class TwkFile extends Equatable {
  /// The file type (e.g., "image", "video", "document")
  final String type;

  /// MIME type (e.g., "image/jpeg", "video/mp4", "application/pdf")
  final String mimeType;

  /// TODO:(TWK-team): as per as support team, data here is not Base64-encoded
  /// Base64-encoded file data (without data URI prefix)
  final String data;

  /// The file name
  final String fileName;

  /// Binary representation of the file
  final Uint8List binary;

  /// Private constructor - use factory methods to create instances.
  const TwkFile._({
    required this.type,
    required this.mimeType,
    required this.data,
    required this.fileName,
    required this.binary,
  });

  /// Creates a TwkFile from a base64-encoded string.
  ///
  /// Automatically removes data URI prefixes if present.
  ///
  /// Parameters:
  /// - [type]: The file type (e.g., "image", "video")
  /// - [mimeType]: The MIME type (e.g., "image/jpeg")
  /// - [base64String]: The base64-encoded file content
  /// - [fileName]: The file name
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

  /// Creates a TwkFile from a JSON map.
  ///
  /// This is the primary method used by the SDK to parse file data
  /// from Tawakkalna API responses.
  ///
  /// The JSON should contain:
  /// - `type`: File type
  /// - `mime_type`: MIME type
  /// - `data`: Base64-encoded file data (with or without data URI prefix)
  /// - `file_name`: File name
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
