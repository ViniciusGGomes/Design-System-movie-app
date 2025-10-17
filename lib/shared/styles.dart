import 'package:flutter/material.dart';
import 'colors.dart';

/// Estilos de tipografia do CineVerse Design System
/// Baseado na fonte Montserrat
class CineTextStyles {
  // H1 - ExtraBold 32px
  static const TextStyle h1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: CineColors.text,
    height: 1.2,
  );

  // H2 - Bold 24px
  static const TextStyle h2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: CineColors.text,
    height: 1.3,
  );

  // H3 - Semibold 18px
  static const TextStyle h3 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: CineColors.text,
    height: 1.4,
  );

  // Body - Semibold 14px
  static const TextStyle body = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CineColors.text,
    height: 1.5,
  );

  // Small text - Semibold 14px
  static const TextStyle smallText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CineColors.textLight,
    height: 1.5,
  );

  // Button text
  static const TextStyle button = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.0,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: CineColors.textLight,
    height: 1.4,
  );
}

/// Theme do CineVerse
class CineTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: CineColors.primary,
      secondary: CineColors.secondaryLight,
      surface: CineColors.surface,
      error: CineColors.error,
      onPrimary: CineColors.textOnPrimary,
      onSecondary: CineColors.text,
      onSurface: CineColors.text,
    ),
    scaffoldBackgroundColor: CineColors.background,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      displayLarge: CineTextStyles.h1,
      displayMedium: CineTextStyles.h2,
      displaySmall: CineTextStyles.h3,
      bodyLarge: CineTextStyles.body,
      bodyMedium: CineTextStyles.smallText,
      labelLarge: CineTextStyles.button,
    ),
  );
}