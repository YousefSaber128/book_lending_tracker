import 'package:flutter/material.dart';

import '../entities/setting_entity.dart' show SettingEntity;
import '../extensions/string_extension.dart';

@immutable
final class SettingModel extends SettingEntity {
  const SettingModel({super.themeMode});

  factory SettingModel.fromEntity(final SettingEntity entity) =>
      SettingModel(themeMode: entity.themeMode);

  factory SettingModel.fromJson(final Map<String, dynamic>? json) =>
      SettingModel(
        themeMode: (json?['themeMode'] as String?).toEnum(ThemeMode.values),
      );

  SettingEntity toEntity() => SettingEntity(themeMode: themeMode);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'themeMode': themeMode?.name,
  };
}
