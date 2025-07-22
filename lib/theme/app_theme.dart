import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );
}
