import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarHelper {
  /// Change status bar text color
  /// [isDarkText] = true -> black text, false -> white text
  static void setStatusBarTextColor({required bool isDarkText}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar background color
      statusBarIconBrightness: isDarkText ? Brightness.dark : Brightness.light,
      statusBarBrightness: isDarkText ? Brightness.light : Brightness.dark,
      // Note: statusBarBrightness is for iOS
    ));
  }
}
