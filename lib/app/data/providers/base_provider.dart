import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:ts_logger/ts_logger.dart';

class BaseGetConnect extends GetConnect {
  BaseGetConnect() {
    if (kDebugMode) {
      // Activate ts_logger only in dev/debug
      TsLogger.instance.activateGetConnectLogger(httpClient);
    }

    httpClient.timeout = const Duration(seconds: 30);
  }
}
