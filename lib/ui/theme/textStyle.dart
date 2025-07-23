import 'package:flutter/material.dart';
import 'color/color.dart'; // make sure the path is correct

class AppTextStyle {
  static TextStyle regular(
    double fontSize, {
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: AppColor.Black,
      fontFamily: 'SpaceGrotesk',
      fontWeight: fontWeight,
    );
  }

  /// Bold variant
  static TextStyle bold(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: AppColor.Black,
      fontFamily: 'SpaceGrotesk',
      fontWeight: FontWeight.bold,
    );
  }

  /// Semi-bold variant
  static TextStyle semiBold(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: AppColor.White,
      fontFamily: 'SpaceGrotesk',
      fontWeight: FontWeight.w600,
    );
  }
}
