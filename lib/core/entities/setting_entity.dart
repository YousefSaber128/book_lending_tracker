import 'package:flutter/material.dart' show ThemeMode, immutable;
import 'package:hive_flutter/hive_flutter.dart'
    show BinaryReader, BinaryWriter, TypeAdapter;

import '../models/setting_model.dart' show SettingModel;

part '../adapters/setting_adapter.dart';

@immutable
base class SettingEntity {
  const SettingEntity({this.themeMode = ThemeMode.system});

  final ThemeMode? themeMode;

  SettingEntity _copyWith({final ThemeMode? themeMode}) =>
      SettingEntity(themeMode: themeMode ?? this.themeMode);

  SettingEntity setThemeMode(final ThemeMode? themeMode) =>
      _copyWith(themeMode: themeMode);

  @override
  String toString() =>
      'ThemeEntity('
      'themeMode: $themeMode, '
      ')';

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is SettingEntity &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode;

  @override
  int get hashCode => themeMode.hashCode;
}
