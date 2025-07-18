part of 'theme_mode_changer_cubit.dart';

@immutable
sealed class ThemeModeChangerState {
  const ThemeModeChangerState();
}

final class ThemeModeChangerInitial extends ThemeModeChangerState {
  const ThemeModeChangerInitial();
}

final class ThemeModeChanged extends ThemeModeChangerState {}
