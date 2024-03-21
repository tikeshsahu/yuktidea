import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class AppTheme {
  static const myColorScheme = ColorScheme(
    primary: Color(0xFFD9896A),
    secondary: Color.fromARGB(255, 17, 17, 17),
    surface: Colors.white,
    background: Colors.black,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  static const dividerColour = LinearGradient(
    colors: [
      Color.fromARGB(255, 17, 18, 18),
      Color.fromARGB(255, 26, 27, 30),
      Color.fromARGB(255, 17, 18, 18),
    ],
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: myColorScheme,
      canvasColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: myColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      dialogBackgroundColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xFF292929),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimension.normalRadius * 3),
          ),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFFF9D3B4)),
          backgroundColor: myColorScheme.primary,
          //padding: EdgeInsets.all(8),
          // padding: const EdgeInsets.symmetric(
          //   vertical: AppDimension.normalPadding - 8.0,
          //   horizontal: AppDimension.normalPadding,
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimension.normalRadius / 2),
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: myColorScheme.primary,
      ),

      // timePickerTheme: TimePickerThemeData(),
      fontFamily: "Quicksand",
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          height: 64 / 57,
          letterSpacing: -0.25,
        ),
        displayMedium: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 52 / 45,
        ),
        displaySmall: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          height: 44 / 36,
        ),
        headlineLarge: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          height: 40 / 32,
        ),
        headlineMedium: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        headlineSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22, height: 32 / 24, color: Colors.grey),
        titleLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, height: 28 / 22, color: myColorScheme.primary),
        titleMedium: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, height: 24 / 16, letterSpacing: 0.1, color: Colors.white),
        titleSmall: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 20 / 14,
          letterSpacing: 0.1,
        ),
        labelLarge: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: Colors.grey),
        labelMedium: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Color(0xFFF9D3B4)),
        labelSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),
        bodyLarge: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: Colors.white,
        ),
        bodyMedium: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFFD9896A),
        ),
        bodySmall: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
