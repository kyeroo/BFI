import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {

  static ThemeData lightTheme =
      ThemeData(

    scaffoldBackgroundColor:
        AppColors.background,

    primaryColor:
        AppColors.primary,

    appBarTheme: AppBarTheme(
      backgroundColor:
          Colors.transparent,

      elevation: 0,
    ),

    inputDecorationTheme:
        InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),

        borderSide: BorderSide.none,
      ),
    ),

    elevatedButtonTheme:
        ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor:
            AppColors.primary,

        foregroundColor:
            Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16),
        ),

        minimumSize:
            Size(double.infinity, 55),
      ),
    ),
  );
}