import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

import '../../../../../core/repositories/setting_repo.dart' show SettingRepo;
import '../../../../../core/services/get_it_service.dart' show getIt;

part 'theme_mode_changer_state.dart';

class ThemeModeChangerCubit extends Cubit<ThemeModeChangerState> {
  ThemeModeChangerCubit() : super(const ThemeModeChangerInitial());

  Future<void> toggleTheme(final BuildContext context) async {
    await getIt<SettingRepo>().toggleTheme(context);
    emit(ThemeModeChanged());
  }
}
