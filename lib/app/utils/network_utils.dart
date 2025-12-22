import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class NetworkUtils extends GetxService {
  static NetworkUtils get instance => Get.find<NetworkUtils>();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  final Rx<List<ConnectivityResult>> _connectionStatus =
  Rx<List<ConnectivityResult>>([ConnectivityResult.none]);

  List<ConnectivityResult> get connectionStatus => _connectionStatus.value;

  bool get isConnected {
    // Check if there's any actual connection (WiFi, Mobile, Ethernet, VPN)
    return _connectionStatus.value.any((result) =>
    result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.vpn);
  }

  // Track if dialog is currently showing
  bool _isDialogShowing = false;

  // Track if initial check is complete
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // Initialize connectivity monitoring
  Future<void> initialize() async {
    try {
      _connectionStatus.value = await _connectivity.checkConnectivity();
      _isInitialized = true;
      debugPrint('NetworkUtils initialized. Connection status: ${_connectionStatus.value}');
      debugPrint('isConnected: $isConnected');
    } on PlatformException catch (e) {
      debugPrint('Couldn\'t check connectivity status: $e');
      _connectionStatus.value = [ConnectivityResult.none];
      _isInitialized = true;
    }
  }

  // Callback to execute when connection is restored
  Function? _onConnectionRestored;

  // Start listening to connectivity changes
  void startMonitoring({Function? onConnectionRestored}) {
    _onConnectionRestored = onConnectionRestored;

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      _connectionStatus.value = result;
      debugPrint('Connection changed: $result');
      debugPrint('isConnected: $isConnected');

      // Auto hide dialog when connection is restored
      if (isConnected && _isDialogShowing) {
        debugPrint('Connection restored - closing dialog');
        Get.back();
        _isDialogShowing = false;

        // Show success message
        Get.snackbar(
          'Connected',
          'Internet connection restored',
          icon: const Icon(Icons.wifi, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );

        // Call the API callback
        _onConnectionRestored?.call();
      } else if (!isConnected && !_isDialogShowing) {
        // Auto show dialog when connection is lost
        debugPrint('Connection lost - showing dialog');
        showNoConnectionDialog(onRetry: _onConnectionRestored);
      }
    });
  }

  // Stop listening to connectivity changes
  void stopMonitoring() {
    _subscription?.cancel();
    _subscription = null;
  }

  // Check current connectivity
  Future<List<ConnectivityResult>> checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _connectionStatus.value = result;
      debugPrint('Manual check - Connection status: $result');
      debugPrint('isConnected: $isConnected');
      return result;
    } on PlatformException catch (e) {
      debugPrint('Error checking connectivity: $e');
      return [ConnectivityResult.none];
    }
  }

  // Show no connection dialog
  void showNoConnectionDialog({Function? onRetry}) {
    if (_isDialogShowing) {
      debugPrint('Dialog already showing - skipping');
      return; // Prevent multiple dialogs
    }

    debugPrint('Showing no connection dialog');
    _isDialogShowing = true;

    Get.dialog(
      PopScope(
        canPop: false,
        child: AlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi_off, color: Get.theme.colorScheme.error, size: 48),
              const SizedBox(height: 12),
              const Text('No Internet Connection'),
            ],
          ),
          content: const Text(
            'Please check your internet connection and try again.',
            textAlign: TextAlign.center,
          ),
          actions: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Get.theme.primaryColor,
              ),
              child: TextButton(
                onPressed: () async {
                  debugPrint('Retry button clicked');
                  await checkConnectivity();

                  if (isConnected) {
                    debugPrint('Connected after retry');
                    Get.back();
                    _isDialogShowing = false;

                    Get.snackbar(
                      'Success',
                      'Connection restored',
                      icon: const Icon(Icons.check_circle, color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 2),
                    );

                    onRetry?.call();
                  } else {
                    debugPrint('Still no connection after retry');
                    Get.snackbar(
                      'Error',
                      'Still no internet connection',
                      icon: const Icon(Icons.error, color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 2),
                    );
                  }
                },
                child: const Text(
                  'Retry',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    ).then((_) {
      debugPrint('Dialog dismissed');
      _isDialogShowing = false;
    });
  }
}
