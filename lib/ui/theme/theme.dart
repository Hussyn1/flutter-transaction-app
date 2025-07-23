import 'package:flutter/material.dart';
import 'package:transaction_application/ui/theme/color/color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.background,
      fontFamily: 'SpaceGrotesk',
      primaryColor: AppColor.CardGreen,
      iconTheme: IconThemeData(color: AppColor.Black),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.Black),
        bodyMedium: TextStyle(color: AppColor.Black),
        titleLarge: TextStyle(color: AppColor.Black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.White,
        selectedItemColor: AppColor.Black,
        unselectedItemColor: AppColor.Black.withOpacity(0.6),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.White,
        iconTheme: IconThemeData(color: AppColor.Black),
        titleTextStyle: TextStyle(
          color: AppColor.Black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'SpaceGrotesk',
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'SpaceGrotesk',
      primaryColor: AppColor.CardGreen,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'SpaceGrotesk',
        ),
      ),
    );
  }
}
