import 'package:flutter/foundation.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_twk_sdk_impl_stub.dart'
    if (dart.library.js_interop) 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_twk_sdk_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2_impl.dart';

export 'package:tawakkalna_sdk_flutter/src/enums/blood_type.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/eqama_type.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/nationality.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/relation.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/user_type.dart';
export 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
export 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
export 'package:tawakkalna_sdk_flutter/src/models/nationality_entity.dart';
export 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';
export 'package:tawakkalna_sdk_flutter/src/models/user_details.dart';
export 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1.dart';
export 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2.dart';
export 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
export 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';
export 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
export 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1_impl.dart';
export 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2_impl.dart';
export 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
export 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_demo_json_impl.dart';

class Twk {
  final TwkHelperV1 v1;
  final TwkHelperV2 v2;

  Twk({TwkApiV1? v1Api, TwkApiV2? v2Api})
      : v1 = TwkHelperV1Impl(v1Api ?? (kDebugMode ? TwkApiV1DemoJsonImpl() : TwkApiV1TwkSdkImpl())),
        v2 = TwkHelperV2Impl(v2Api ?? (kDebugMode ? TwkApiV2DemoJsonImpl() : TwkApiV2DemoJsonImpl()));
}
