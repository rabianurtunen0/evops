import 'package:flutter/material.dart';

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
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        color: Color(0XFF131622),
      ),
      headlineMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        color: Color(0XFF131622),
      ),
      headlineSmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        color: Color(0XFF131622),
      ),
      bodyLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        color: Color(0XFF8ABA41),
      ),
      bodyMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        color: Color(0XFF131622),
      ),
      bodySmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        color: Color(0XFF8ABA41),
      ),
      titleLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Color(0XFF131622),
      ),
      titleMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        color: Color(0XFF131622),
      ),
      titleSmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Color(0XFF131622),
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: Color(0XFFFFFDFA),
        letterSpacing: 1.5,
      ),
      displayLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: Color(0XFF878999),
      ),
      displayMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
        color: Color(0XFF878999),
      ),
      displaySmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: Color(0XFF878999),
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
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        color: Color(0XFF8ABA41),
      ),
      bodyMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
          //fontFamily: 'AvenirNext',
          fontWeight: FontWeight.w600,
          fontSize: 13.0,
          color: Color(0XFF8ABA41)),
      titleLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: Color(0XFFFFFDFA),
        letterSpacing: 1.5,
      ),
      displayLarge: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: Color(0XFF878999),
      ),
      displayMedium: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
        color: Color(0XFF878999),
      ),
      displaySmall: TextStyle(
        //fontFamily: 'AvenirNext',
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: Color(0XFF878999),
      ),
    ),
  );
}
