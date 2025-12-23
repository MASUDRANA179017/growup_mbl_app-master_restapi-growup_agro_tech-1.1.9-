import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:logger/logger.dart';

class ApiLogger {
  static bool enableLog = true;

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 120,
      printEmojis: true,
    ),
  );

  static Future<void> logRequest(Request request) async {
    if (!enableLog || !kDebugMode) return;

    // final body = await _parseBody(request);

    _logger.i(
        '➡️ REQUEST [${request.method}]\n'
            'URL: ${request.url}\n'
            'Headers: ${request.headers}\n'
      // 'Body: $body',
    );
  }

  static void logResponse({
    required int statusCode,
    required String url,
    dynamic body,
  }) {
    if (!enableLog || !kDebugMode) return;

    _logger.d(
      '✅ RESPONSE [$statusCode]\n'
          'URL: $url\n'
          'Body: $body',
    );
  }

  static void logError({
    required String url,
    required dynamic error,
    dynamic response,
    dynamic statusCode
  }) {
    if (!enableLog || !kDebugMode) return;

    _logger.e(
        '❌ ERROR\n'
            'URL: $url\n'
            'code: $statusCode\n'
            'Error: $error\n'
            'response $response'
    );
  }

// static Future<void> logBody(Request request)async{
//   _parseBody(request).then((v){
//     _logger.d("Body: ---------------\n$v");
//   });
// }
// static Future<dynamic> _parseBody(Request request) async {
//   if (request.method == 'GET') return null;
//
//   final bytes = request.bodyBytes;
//   if (bytes == null) return null;
//
//   final builder = BytesBuilder();
//   await for (final chunk in bytes) {
//     builder.add(chunk);
//   }
//   return String.fromCharCodes(builder.takeBytes());
// }
}