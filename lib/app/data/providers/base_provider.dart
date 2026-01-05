import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:growup_agro/app/component/logger/print_global.dart';

import '../../component/logger/api_logger.dart';
import '../../theme/colors.dart';
import '../../utils/network_utils.dart';
import '../../utils/snackbar.dart';
import '../../utils/utils.dart';
import '../models/helper/error_response.dart';

abstract class BaseConnect extends GetConnect {
  @override
  void onInit() {
    super.onInit();

    debugPrint('🔥 BaseConnect initialized');

    // Request logging
    httpClient.addRequestModifier<dynamic>((Request request) async {
      // Log the request URL, method, and headers
      await ApiLogger.logRequest(request);

      // Extra: log POST body if method is POST
      if (request.method.toUpperCase() != 'GET' ) {
        //TODO log post body here
        // await ApiLogger.logBody(request);
      }

      return request;
    });

    // Response logging
    httpClient.addResponseModifier((request, response) {
      if (response.hasError) {
        ApiLogger.logError(
          url: request.url.toString(),
          error: response.statusText,
          statusCode: response.statusCode,
          response: response.bodyString,
        );
      } else {
        ApiLogger.logResponse(
          statusCode: response.statusCode ?? 0,
          url: request.url.toString(),
          body: response.bodyString,
        );
      }
      return response;
    });
  }


}

Future<T?> safeApiCall<T>({
  required Future<Response> Function() request,
  required T Function(Map<String, dynamic>) onSuccess,
  bool showSuccessSnackBar = true,
  bool showLoading = true,
  RxBool? isLoading ,
}) async {
  isLoading?.value = true;
  if(showLoading) EasyLoading.show();

  if(!NetworkUtils.instance.isConnected){
    getSnackBar('No Internet!. Please connect to the network!');
    if(showLoading) EasyLoading.dismiss();
    isLoading?.value = false;
    return null;
  }
  final response = await request();
  globalPrint(response.bodyString);
  if (response.status.hasError) {
    String message = "Something went wrong!";

    try {
      message = ErrorResponse.fromJson(
        jsonDecode(response.bodyString ?? ""),
      ).message ?? message;
    } catch (e) {
      debugPrint(e.toString());
    }

    if (response.statusCode != 404) {
      Utils.showProviderError(response.statusCode, message);
    }
    if(showLoading) EasyLoading.dismiss();
    isLoading?.value = false;
    return null;
  } else {
    final data = jsonDecode(response.bodyString ?? "");
    final result = onSuccess(data);

    if (showSuccessSnackBar && data['message'] != null) {
      getSnackBar(
        data['message'],
        title: 'Success',
        color: greenColor,
        icon: Icons.done,
      );
    }
    if(showLoading) EasyLoading.dismiss();
    isLoading?.value = false;
    return result;
  }
}