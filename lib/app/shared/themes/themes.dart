import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_schemes.g.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: _lightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: _lightColorScheme.primary,
    centerTitle: true,
    foregroundColor: _lightColorScheme.background,
    iconTheme: IconThemeData(
      color: _lightColorScheme.background,
    ),
  ),
  scaffoldBackgroundColor: _lightColorScheme.background,
  dialogTheme: DialogTheme(
    backgroundColor: _lightColorScheme.background,
    surfaceTintColor: _lightColorScheme.background,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => _lightColorScheme.background,
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) => _lightColorScheme.onPrimaryContainer,
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: _darkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: _darkColorScheme.onPrimary,
    centerTitle: true,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: _darkColorScheme.scrim,
    surfaceTintColor: _darkColorScheme.scrim,
  ),
  scaffoldBackgroundColor: _darkColorScheme.scrim,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => _darkColorScheme.onBackground,
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) => _darkColorScheme.onPrimary,
      ),
    ),
  ),
);
