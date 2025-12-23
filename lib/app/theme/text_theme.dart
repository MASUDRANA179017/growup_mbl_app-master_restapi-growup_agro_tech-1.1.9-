import 'package:flutter/material.dart';
import 'colors.dart';

/// Base getFont function
TextStyle getFont({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  FontStyle? fontStyle,
  TextDecoration? decoration,
  TextDecorationStyle? decorationStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  double? height,
}) {
  return TextStyle(
    fontFamily: "FontMain",
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: decorationStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    height: height,
  );
  // return GoogleFonts.inter(
  //   fontSize: fontSize,
  //   fontWeight: fontWeight,
  //   color: color,
  //   fontStyle: fontStyle,
  //   decoration: decoration,
  //   decorationStyle: decorationStyle,
  //   letterSpacing: letterSpacing,
  //   wordSpacing: wordSpacing,
  //   textBaseline: textBaseline,
  //   locale: locale,
  //   foreground: foreground,
  //   background: background,
  //   shadows: shadows,
  //   height: height,
  // );
}

/// =================== TEXT WIDGETS ===================

Widget text_24_700(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.end}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 24, fontWeight: FontWeight.w700, color: color),
    textAlign: textAlign,
  );
}

Widget text_24_600(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.end}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 24, fontWeight: FontWeight.w600, color: color),
    textAlign: textAlign,
  );
}

Widget text_24_500(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.end}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 24, fontWeight: FontWeight.w500, color: color),
    textAlign: textAlign,
  );
}

Widget text_24_400(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.end}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 24, fontWeight: FontWeight.w400, color: color),
    textAlign: textAlign,
  );
}

Widget text_20_600(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start, int? maxLine, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 20, fontWeight: FontWeight.w600, color: color),
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
  );
}

Widget text_20_400(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start, int? maxLine, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 20, fontWeight: FontWeight.w400, color: color),
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
  );
}

Widget text_20_300(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start, int? maxLine, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 20, fontWeight: FontWeight.w300, color: color),
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
  );
}

Widget text_18_700(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 18, fontWeight: FontWeight.w700, color: color),
    textAlign: textAlign,
  );
}

Widget text_18_400(String? value, {Color color = textColorBlack, int? maxLine}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 18, fontWeight: FontWeight.w400, color: color),
    maxLines: maxLine,
    overflow: maxLine != null ? TextOverflow.ellipsis : null,
  );
}

Widget text_16_700(String? value, {Color color = textColorBlack, int maxLine = 1, TextAlign textAlign = TextAlign.end}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 16, fontWeight: FontWeight.w700, color: color),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

Widget text_16_600(String? value, {Color color = textColorBlack, int? maxLine, TextAlign textAlign = TextAlign.start, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 16, fontWeight: FontWeight.w600, color: color),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
    textAlign: textAlign,
  );
}

Widget text_16_500(String? value, {Color color = textColorBlack, int? maxLine, TextOverflow? overflow, TextAlign textAlign = TextAlign.justify}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 16, fontWeight: FontWeight.w500, color: color),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
    textAlign: textAlign,
  );
}

Widget text_16_400(String? value, {Color color = textColorBlack, TextStyle textStyle = const TextStyle(), TextAlign textAlign = TextAlign.start}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 16, fontWeight: FontWeight.w400, color: color).merge(textStyle),
    textAlign: textAlign,
  );
}

Widget text_16_300(String? value, {Color color = textColorBlack, int? maxLine, TextDecoration? decoration}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 16, fontWeight: FontWeight.w300, color: color, decoration: decoration),
    maxLines: maxLine,
    overflow: maxLine != null ? TextOverflow.ellipsis : null,
  );
}

Widget text_14_700(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 14, fontWeight: FontWeight.w700, color: color),
    textAlign: textAlign,
  );
}

Widget text_14_600(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 14, fontWeight: FontWeight.w600, color: color),
    textAlign: textAlign,
  );
}

Widget text_14_500(String? value, {Color color = textColorBlack, TextAlign textAlign = TextAlign.start, int? maxLine, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 14, fontWeight: FontWeight.w500, color: color),
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
  );
}

Widget text_14_400(String? value, {Color color = textColorBlack, int? maxLine, TextAlign textAlign = TextAlign.start}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 14, fontWeight: FontWeight.w400, color: color),
    maxLines: maxLine,
    overflow: maxLine != null ? TextOverflow.ellipsis : null,
    textAlign: textAlign,
  );
}

Widget text_14_300(String? value, {Color color = textColorBlack, TextStyle? textStyle, int? maxLine, TextAlign textAlign = TextAlign.start, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 14, fontWeight: FontWeight.w300, color: color).merge(textStyle),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
    textAlign: textAlign,
  );
}

Widget text_14_300_lineThrough(String? value, {Color color = textColorBlack}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 14, fontWeight: FontWeight.w400, color: color, decoration: TextDecoration.lineThrough),
  );
}

Widget text_12_500(String? value, {Color color = textColorBlack, int? maxLine, TextAlign textAlign = TextAlign.start, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 12, fontWeight: FontWeight.w500, color: color),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
    textAlign: textAlign,
  );
}

Widget text_12_400(String? value, {Color color = textColorBlack, int? maxLine, TextAlign textAlign = TextAlign.start, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 12, fontWeight: FontWeight.w400, color: color),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
    textAlign: textAlign,
  );
}

Widget text_12_300(String? value, {Color color = textColorBlack, int? maxLine, TextAlign textAlign = TextAlign.start, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 12, fontWeight: FontWeight.w300, color: color),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
    textAlign: textAlign,
  );
}

Widget text_10_400(String? value, {Color color = textColorBlack, int? maxLine, TextOverflow? overflow}) {
  return Text(
    value ?? '',
    style: getFont(fontSize: 10, fontWeight: FontWeight.w400, color: color),
    maxLines: maxLine,
    overflow: overflow ?? (maxLine != null ? TextOverflow.ellipsis : null),
  );
}

/// Example RichText
Widget alreadyHaveAccountText() {
  return Center(
    child: RichText(
      text: TextSpan(
        style: getFont(fontSize: 14, fontWeight: FontWeight.w400, color: textColorBlack),
        children: [
          const TextSpan(text: 'Already have an Account? '),
          TextSpan(
            text: 'Sign In',
            style: getFont(fontSize: 14, fontWeight: FontWeight.w700, color: textColorBlack),
          ),
        ],
      ),
    ),
  );
}
