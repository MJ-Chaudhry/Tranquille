import 'package:flutter/material.dart';

Color background = const Color.fromRGBO(223, 221, 206, 1);
Color onBackground = const Color.fromRGBO(122, 113, 22, 1);
Color primary = const Color.fromRGBO(211, 154, 64, 1);
Color onPrimary = const Color.fromRGBO(211, 154, 64, 1);
Color secondary = const Color.fromRGBO(50, 29, 10, 1);
Color onSecondary = const Color.fromRGBO(50, 29, 10, 1);
Color error = Colors.red;
Color onError = Colors.black;

const double bodySmallSize = 16;
const double bodyMediumSize = 18;
const double bodyLargeSize = 21;
const double headlineSmallSize = 18;
const double headlineMediumSize = 21;
const double headlineLargeSize = 24;

/// Light color scheme.
ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primary,
  onPrimary: onPrimary,
  secondary: secondary,
  onSecondary: onSecondary,
  error: error,
  onError: onError,
  surface: background,
  onSurface: onBackground,
);

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontSize: headlineLargeSize,
      ),
      headlineMedium: TextStyle(
        decorationColor: lightColorScheme.secondary,
        fontSize: headlineMediumSize,
      ),
      headlineSmall: TextStyle(
        decorationColor: lightColorScheme.secondary,
        fontSize: headlineSmallSize,
      ),
      bodyLarge: const TextStyle(
        fontSize: bodyLargeSize,
      ),
      bodyMedium: const TextStyle(
        fontSize: bodyMediumSize,
      ),
      bodySmall: const TextStyle(
        fontSize: bodySmallSize,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: lightColorScheme.surface,
      height: 64,
      indicatorColor: lightColorScheme.primary,
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: lightColorScheme.primary,
        ),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: lightColorScheme.surface,
      useIndicator: false,
      selectedIconTheme: IconThemeData(color: lightColorScheme.primary),
    ));
