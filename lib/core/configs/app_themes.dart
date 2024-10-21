import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_color.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    primaryColor: AppColor.primaryColor,
    fontFamily: "Satoshi",
    scaffoldBackgroundColor: const Color(0xffF2F2F2),
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsetsDirectional.symmetric(
        horizontal: 12,
      ),
      hintStyle: AppTextStyle.styleMedium16().copyWith(
        color: const Color(0xff383838).withOpacity(0.6),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    primaryColor: AppColor.primaryColor,
    fontFamily: "Satoshi",
    scaffoldBackgroundColor: const Color(0xff0D0C0C),
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.styleBold16().copyWith(
        color: const Color(0xffA7A7A7).withOpacity(0.6),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
    ),
  );
}
