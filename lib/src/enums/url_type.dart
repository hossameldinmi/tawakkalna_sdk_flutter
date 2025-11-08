import 'package:tawakkalna_sdk_flutter/src/core/base_enum.dart';

class UrlType extends BaseEnum<int, UrlType> {
  const UrlType._(super.value) : super();
  static const http = UrlType._(1);
  static const tel = UrlType._(2);
  static const mailTo = UrlType._(3);
  static const deepLink = UrlType._(4);
  static const sms = UrlType._(5);

  static List<UrlType> get values => [
        http,
        tel,
        mailTo,
        deepLink,
        sms,
      ];
}
