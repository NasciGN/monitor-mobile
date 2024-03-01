import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';

ThemeData customDarkTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: darkBgColor,
        primary: darkScdBgColor,
        secondary: darkTrdBgColor,
        tertiary: darkBtnColor,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: darkBtnColor),
      dialogTheme: DialogTheme(backgroundColor: Colors.white));
}
