import 'package:flutter/material.dart';

extension IsDarkThemeExtention on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
}
