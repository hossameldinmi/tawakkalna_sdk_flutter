import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2_impl.dart';

class Twk {
  final TwkHelperV1 v1;
  final TwkHelperV2 v2;

  Twk({TwkApiV1? v1Api, TwkApiV2? v2Api})
      : v1 = TwkHelperV1Impl(v1Api ??= TwkApiV1DemoJsonImpl()),
        v2 = TwkHelperV2Impl(v2Api ??= TwkApiV2DemoJsonImpl());
}
