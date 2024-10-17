import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_color.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    fontFamily: "Satoshi",
    scaffoldBackgroundColor: const Color(0xffF2F2F2),
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    fontFamily: "Satoshi",
    scaffoldBackgroundColor: const Color(0xff0D0C0C),
    brightness: Brightness.dark,
  );
}
