import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';

ThemeData customDarkTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: darkBgColor,
        primary: darkScdBgColor,
        secondary: darkScdBgColor,
      ),
      drawerTheme:
          const DrawerThemeData(backgroundColor: darkTrdBgColor, elevation: 10),
      iconTheme: const IconThemeData(color: darkIcnColor),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                // Cor quando o botão está pressionado
                return darkIcnColor;
              }
              // Cor padrão
              return darkIcnColor;
            },
          ),
        ),
      ));
}
