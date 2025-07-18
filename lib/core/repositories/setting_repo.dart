import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart'
    show Brightness, BuildContext, Theme, ThemeMode;

import '../constants/hive_keys.dart' show HiveKeys;
import '../entities/setting_entity.dart' show SettingAdapter, SettingEntity;
import '../models/setting_model.dart' show SettingModel;
import '../services/get_it_service.dart' show getIt;
import '../services/local_database_service.dart';

@immutable
sealed class SettingRepo {
  const SettingRepo();

  void registerAdapter();

  Future<void> init();

  Future<void> setSetting(final SettingEntity theme);

  SettingEntity getSetting();

  Future<void> toggleTheme(final BuildContext context);

  Future<void> clear();
}

@immutable
final class SettingRepoImplementation implements SettingRepo {
  const SettingRepoImplementation();

  static final LocalDatabaseService _localDatabase =
      getIt<LocalDatabaseService>();

  @override
  void registerAdapter() =>
      _localDatabase.registerAdapter<SettingEntity>(SettingAdapter());

  @override
  Future<void> init() => _localDatabase.openBox(HiveKeys.setting);

  @override
  Future<void> setSetting(final SettingEntity theme) => _localDatabase.add(
    HiveKeys.setting,
    HiveKeys.setting,
    SettingModel.fromEntity(theme).toJson(),
  );

  @override
  SettingEntity getSetting() {
    final json = _localDatabase.getDocument(HiveKeys.setting, HiveKeys.setting);
    if (json?.isNotEmpty ?? false) {
      return SettingModel.fromJson(json).toEntity();
    }
    return const SettingEntity();
  }

  @override
  Future<void> toggleTheme(final BuildContext context) {
    final currentSetting = getSetting();
    return setSetting(
      currentSetting.setThemeMode(
        Theme.of(context).brightness == Brightness.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }

  @override
  Future<void> clear() => _localDatabase.clear(HiveKeys.setting);
}
