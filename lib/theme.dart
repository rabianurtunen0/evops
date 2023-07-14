import 'package:flutter/material.dart';

class Themes {

static final lightTheme = ThemeData(
  backgroundColor: Colors.white,
  primaryColor: const Color(0XFF8ABA41),
  iconTheme: const IconThemeData(
    color: Colors.black
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Color(0XFF2A2B2E),
    ),
     titleSmall: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: Color(0XFF2A2B2E),
    ),
    headlineSmall: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 12.0,
      color: Colors.black,
    ),
  ),
  

);

static final darkTheme = ThemeData(
  backgroundColor: const Color(0XFF2A2B2E),
  primaryColor: const Color(0XFF8ABA41),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      color: Color(0XFFFAFAFA),
    ),
    titleSmall: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
      color: Color(0XFFFAFAFA),
    ),
    headlineSmall: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 12.0,
      color: Colors.white,
    ),
  )
);


}