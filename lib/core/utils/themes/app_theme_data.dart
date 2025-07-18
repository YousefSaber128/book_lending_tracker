import 'package:flutter/material.dart'
    show
        AppBarTheme,
        CardThemeData,
        DialogThemeData,
        EdgeInsets,
        EdgeInsetsDirectional,
        FilledButton,
        FilledButtonThemeData,
        FloatingActionButtonThemeData,
        IconButton,
        IconButtonThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        OutlinedButton,
        OutlinedButtonThemeData,
        RoundedSuperellipseBorder,
        Size,
        TextButton,
        TextButtonThemeData,
        TextOverflow,
        TextStyle,
        TextTheme,
        immutable;

import '../../constants/borders.dart' show AppBorders;

@immutable
sealed class AppThemeData {
  const AppThemeData();

  static const AppBarTheme appBar = AppBarTheme(
    elevation: 0,
    actionsPadding: EdgeInsets.only(right: 8),
  );

  static const InputDecorationTheme inputDecoration = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: AppBorders.xs),
    alignLabelWithHint: true,
  );

  static const TextTheme text = TextTheme(
    displayLarge: TextStyle(overflow: TextOverflow.fade),
    displayMedium: TextStyle(overflow: TextOverflow.fade),
    displaySmall: TextStyle(overflow: TextOverflow.fade),
    headlineLarge: TextStyle(overflow: TextOverflow.fade),
    headlineMedium: TextStyle(overflow: TextOverflow.fade),
    headlineSmall: TextStyle(overflow: TextOverflow.fade),
    titleLarge: TextStyle(overflow: TextOverflow.fade),
    titleMedium: TextStyle(overflow: TextOverflow.fade),
    titleSmall: TextStyle(overflow: TextOverflow.fade),
    bodyLarge: TextStyle(overflow: TextOverflow.fade),
    bodyMedium: TextStyle(overflow: TextOverflow.fade),
    bodySmall: TextStyle(overflow: TextOverflow.fade),
    labelLarge: TextStyle(overflow: TextOverflow.fade),
    labelMedium: TextStyle(overflow: TextOverflow.fade),
    labelSmall: TextStyle(overflow: TextOverflow.fade),
  );

  static const CardThemeData card = CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
  );

  static const DialogThemeData dialog = DialogThemeData(
    elevation: 0,
    shape: RoundedSuperellipseBorder(borderRadius: AppBorders.m),
    actionsPadding: EdgeInsetsDirectional.only(bottom: 16, end: 16, start: 16),
    insetPadding: EdgeInsets.all(16),
  );

  static final FilledButtonThemeData filledButton = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16),
      minimumSize: const Size.fromHeight(56),
      shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xs),
    ),
  );

  static const FloatingActionButtonThemeData floatingActionButton =
      FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedSuperellipseBorder(borderRadius: AppBorders.s),
      );

  static final IconButtonThemeData iconButton = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xxs),
    ),
  );

  static final OutlinedButtonThemeData outlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16),
      minimumSize: const Size.fromHeight(56),
      shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xs),
    ),
  );

  static final textButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xxs),
    ),
  );
}
