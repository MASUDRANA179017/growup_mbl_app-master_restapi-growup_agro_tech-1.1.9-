import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: Colors.green,
      secondary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: borderGreyColor),
    gapPadding: 2,
  );

  OutlineInputBorder outlineInputFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: primaryDarkColor),
    gapPadding: 2,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputFocusedBorder,
    contentPadding: const EdgeInsets.only(
      top: 8,
      bottom: 8,
      left: 12,
      right: 0,
    ),
    border: outlineInputBorder,
    hintStyle: GoogleFonts.openSans(
      textStyle: TextStyle(color: secondaryTextColor, fontSize: 12),
    ),
  );
}
