import 'package:flutter/material.dart';

class Themes {

static final lightTheme = ThemeData(
  backgroundColor: Colors.white,
  cardColor: Color(0XFFF0F1F0),
  highlightColor: Color(0XFF2A2B2E),
  disabledColor: Color(0XFFA1A1AA),
  primaryColor: const Color(0XFF8ABA41),
  primaryColorLight: Color(0XFFD9F99D),
  primaryColorDark: Color(0XFF4D7C0F),
  unselectedWidgetColor: Colors.purpleAccent,
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
     headlineMedium: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: Color(0XFF2A2B2E),
    ),
  ),
  

);

static final darkTheme = ThemeData(
  //backgroundColor: const Color(0XFF2A2B2E),
  backgroundColor: const Color(0XFF282A37),
  cardColor: Color.fromARGB(255, 64, 64, 77),
  highlightColor: Colors.white,
  disabledColor: Color(0XFFA1A1AA),
  primaryColor: const Color(0XFF8ABA41),
  primaryColorLight: Color(0XFFD9F99D),
  primaryColorDark: Color(0XFF4D7C0F),


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
    headlineMedium: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.white,
    ),
  ),
);


}