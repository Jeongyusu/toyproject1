import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

TextStyle h3() {
  return TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: basicColorB1);
}

TextStyle h4() {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: basicColorB3);
}

TextStyle h5() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, color: basicColorB3);
}

TextStyle h6() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: basicColorB3);
}

TextStyle disabledText() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: basicColorB5);
}

TextStyle discountText() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: accentColor);
}

TextStyle productPriceText() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: basicColorB1);
}
