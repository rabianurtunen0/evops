import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static final lightTheme = ThemeData(
    backgroundColor: const Color(0XFFFFFFFFF),
    cardColor: const Color(0XFFF0F1F0),
    highlightColor: const Color(0XFF131622),
    disabledColor: const Color(0XFF878999),
    hoverColor: const Color(0XFFD8DAEB),
    primaryColor: const Color(0XFF8ABA41),
    primaryColorLight: const Color(0XFFD9F99D),
    primaryColorDark: const Color(0XFF749B3A),
    iconTheme: const IconThemeData(
      color: Color(0XFF131622),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(22),
        color: const Color(0XFF131622),
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(20),
        color: const Color(0XFF131622),
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(18),
        color: const Color(0XFF131622),
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(12),
        color: const Color(0XFF8ABA41),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(11),
        color: const Color(0XFF131622),
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(11),
        color: const Color(0XFF8ABA41),
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(14),
        color: const Color(0XFF131622),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(13),
        color: const Color(0XFF131622),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(12),
        color: const Color(0XFF131622),
      ),
      labelLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(14),
        color: const Color(0XFF131622),
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(14),
        color: const Color(0XFFFFFDFA),
        letterSpacing: 1.5,
      ),
      labelSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(12),
        color: const Color(0XFF131622),
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(14),
        color: const Color(0XFF878999),
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(13),
        color: const Color(0XFF878999),
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(12),
        color: const Color(0XFF878999),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    backgroundColor: const Color(0XFF282A37),
    cardColor: const Color(0XFF40404D),
    highlightColor: const Color(0XFFFFFFFF),
    disabledColor: const Color(0XFF878999),
    hoverColor: const Color(0XFF555766),
    primaryColor: const Color(0XFF8ABA41),
    primaryColorLight: const Color(0XFFD9F99D),
    primaryColorDark: const Color(0XFF4D7C0F),
    iconTheme: const IconThemeData(
      color: Color(0XFFFFFFFF),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(22),
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(20),
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(18),
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(12),
        color: const Color(0XFF8ABA41),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(11),
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(11),
        color: const Color(0XFF8ABA41),
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(14),
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(13),
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(12),
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(14),
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(14),
        color: const Color(0XFFFFFDFA),
        letterSpacing: 1.5,
      ),
      labelSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(12),
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(14),
        color: const Color(0XFF878999),
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(13),
        color: const Color(0XFF878999),
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(12),
        color: const Color(0XFF878999),
      ),
    ),
  );
}
