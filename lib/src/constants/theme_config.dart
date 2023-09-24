import 'package:flutter/material.dart';

class ThemeConfig {

  final kColorSchema = ColorScheme.fromSeed(
    seedColor: const Color(0xFF549C41),
  );
  final darkColorSchema = ColorScheme.fromSeed(
    seedColor: const Color(0xFF101900),
  );

  ThemeData get  theme => ThemeData(
    fontFamily: 'Ubuntu',
  ).copyWith(
    useMaterial3: true,
    colorScheme: kColorSchema,
    expansionTileTheme: const ExpansionTileThemeData().copyWith(
      collapsedBackgroundColor:
      kColorSchema.onPrimaryContainer.withOpacity(0.9),
      collapsedTextColor: kColorSchema.primaryContainer.withOpacity(0.7),
      collapsedIconColor: kColorSchema.primaryContainer.withOpacity(0.7),
      backgroundColor: kColorSchema.onPrimaryContainer.withOpacity(0.9),
      textColor: kColorSchema.primaryContainer.withOpacity(0.7),
      iconColor: kColorSchema.primaryContainer.withOpacity(0.7),
    ),
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorSchema.onPrimaryContainer,
      foregroundColor: kColorSchema.primaryContainer,
    ),
    scaffoldBackgroundColor: kColorSchema.primaryContainer,
  );
}