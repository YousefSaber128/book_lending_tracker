import 'package:flutter/material.dart'
    show
        Brightness,
        ColorScheme,
        Colors,
        DynamicSchemeVariant,
        ThemeData,
        immutable;

import 'app_theme_data.dart' show AppThemeData;

@immutable
final class ThemeConfig {
  const ThemeConfig();

  ThemeData? get light => _themeData();

  ThemeData? get dark => _themeData(Brightness.dark);

  ThemeData? _themeData([final Brightness brightness = Brightness.light]) =>
      ThemeData(
        inputDecorationTheme: AppThemeData.inputDecoration,
        useSystemColors: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: brightness,
          dynamicSchemeVariant: DynamicSchemeVariant.content,
        ),
        brightness: brightness,
        fontFamily: 'Cairo',
        fontFamilyFallback: const <String>['Cairo', 'Roboto'],
        textTheme: AppThemeData.text,
        filledButtonTheme: AppThemeData.filledButton,
        iconButtonTheme: AppThemeData.iconButton,
        outlinedButtonTheme: AppThemeData.outlinedButton,
        textButtonTheme: AppThemeData.textButton,
      );
}
