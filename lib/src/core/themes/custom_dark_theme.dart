import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';

ThemeData customDarkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: darkBgColor,
      primary: darkPrmBgColor,
      secondary: darkScdBgColor,
      tertiary: activeItmColor,
      error: inactiveItmColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(darkBtnColor),
        foregroundColor:
            const WidgetStatePropertyAll(Colors.white), // Define a cor do texto
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 20, // Tamanho do texto
            fontWeight: FontWeight.bold, // Peso da fonte
          ),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(backgroundColor: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    drawerTheme: const DrawerThemeData(backgroundColor: darkPrmBgColor),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      titleMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      titleSmall: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      displayLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60),
      displayMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
      displaySmall: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
      bodyLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      bodyMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      bodySmall: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      labelLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      labelMedium: TextStyle(
          color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
      labelSmall: TextStyle(
          color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 15),
    ),
  );
}
