import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

Widget text_24_700(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.end,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
  );
}

Widget text_24_600(
    String? value, {
      Color color = textColorBlack,
      TextAlign textAlign = TextAlign.end,
    }) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
  );
}

Widget text_24_400(
    String? value, {
      Color color = textColorBlack,
      TextAlign textAlign = TextAlign.end,
    }) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 24,
    ),
  );
}

Widget text_24_500(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.end,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
  );
}

Widget text_20_300(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
      int? maxLines,
      TextOverflow? overflow
}) {
  return Text(
    "$value",
    maxLines: maxLines,
    overflow: overflow,
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    ),
  );
}

Widget text_20_400(
    String? value, {
      Color color = textColorBlack,
      TextAlign textAlign = TextAlign.start,
      int? maxLines,
      TextOverflow? overflow
    }) {
  return Text(
    "$value",
    maxLines: maxLines,
    overflow: overflow,
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
  );
}

Widget text_20_600(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
      TextOverflow  textOverflow = TextOverflow.visible,
      int? maxLine,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    textAlign: textAlign,
    overflow: textOverflow,
    maxLines: maxLine,
  );
}

Widget text_16_500(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.justify,
  int? maxLine,
      TextOverflow textOverflow = TextOverflow.visible,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    maxLines: maxLine,
    overflow: textOverflow,
    textAlign: textAlign,
  );
}

Widget text_16_700(
    String? value, {
    Color color = textColorBlack,
    TextAlign textAlign = TextAlign.end,
    int maxLine = 1,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    maxLines: maxLine,
  );
}

Widget text_16_400(
  String? value, {
  Color color = textColorBlack,
  TextStyle textStyle = const TextStyle(),
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ).merge(textStyle),
    textAlign: textAlign,
  );
}

Widget text_16_600(String? value, {Color color = textColorBlack, int? maxline}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    maxLines: maxline,
  );
}

Widget text_14_400(String? value, {Color color = textColorBlack, int? maxLine, textAlign = TextAlign.start}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    maxLines: maxLine,
    overflow: maxLine != null ? TextOverflow.ellipsis : null,
    textAlign: textAlign,
  );
}

Widget text_14_600(String? value, {Color color = textColorBlack}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );
}
Widget text_14_300(String? value, {Color color = textColorBlack, FontStyle? fontStyle, TextAlign textAlign = TextAlign.start,TextOverflow textOverflow = TextOverflow.visible,int? maxLine }) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
    textAlign: textAlign,
    overflow: textOverflow,
    maxLines: maxLine,
  );
}

Widget text_16_300(String? value, {Color color = textColorBlack, int? maxline, TextDecoration? decoration}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      decoration: decoration
    ),
    maxLines: maxline,
  );
}

Widget text_18_400(String? value, {Color color = textColorBlack, int? maxline}) {
  return Text(
    "$value",
    style:  GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    maxLines: maxline,
  );
}

Widget text_18_700(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
    textAlign: textAlign,
  );
}

Widget text_14_500(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
  TextOverflow textOverflow = TextOverflow.visible, int? maxLine,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    textAlign: textAlign,
    overflow: textOverflow,
    maxLines: maxLine,
  );
}

Widget text_14_700(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    textAlign: textAlign,
  );
}

Widget text_12_400(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
  TextOverflow textOverflow = TextOverflow.visible,
  int? maxLine,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    overflow: textOverflow,
    textAlign: textAlign,
    maxLines: maxLine,
  );
}

Widget text_12_300(
  String? value, {
  Color color = textColorBlack,
  TextAlign textAlign = TextAlign.start,
  TextOverflow textOverflow = TextOverflow.visible,
  int? maxLine,
}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 12,
    ),
    overflow: textOverflow,
    textAlign: textAlign,
    maxLines: maxLine,
  );
}

Widget text_12_500(String? value, {Color color = textColorBlack, int? maxline, textAlign = TextAlign.start, TextOverflow textOverflow = TextOverflow.visible}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    maxLines: maxline,
    textAlign: textAlign,
    overflow: textOverflow,
  );
}

Widget text_12_400Max2(String? value, {Color color = textColorBlack, int? maxline}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: maxline,
  );
}

Widget text_10_400(String? value, {Color color = textColorBlack, int? maxline}) {
  return Text(
    "$value",
    style: TextStyle(
      fontFamily: 'LiAdorNoirrit',
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
    maxLines: maxline,
  );
}

Widget alreadyHaveAccountText() {
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'LiAdorNoirrit',
          color: textColorBlack,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          const TextSpan(text: 'Already have an Account? '),
          TextSpan(
            text: 'Sign In',
            style: TextStyle(
              fontFamily: 'LiAdorNoirrit',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: textColorBlack,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget text_14_300_linethrough(String? value, {Color color = textColorBlack}) {
  return Text(
    "$value",
    style: GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      decoration: TextDecoration.lineThrough,
    ),
  );
}
