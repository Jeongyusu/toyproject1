import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: basicColorW,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: Size(double.infinity, 60)),
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    centerTitle: true,
    backgroundColor: primaryColor,
    elevation: 0.5,
  );
}
