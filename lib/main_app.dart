import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'core/helpers/routes.dart' show AppRouter;
import 'core/repositories/setting_repo.dart' show SettingRepo;
import 'core/services/get_it_service.dart' show getIt;
import 'core/utils/themes/theme_config.dart' show ThemeConfig;
import 'features/home/presentation/controllers/theme_mode_changer_cubit/theme_mode_changer_cubit.dart'
    show ThemeModeChangerCubit, ThemeModeChangerState;
import 'features/home/presentation/views/home_view.dart' show HomeView;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(_) => BlocBuilder<ThemeModeChangerCubit, ThemeModeChangerState>(
    builder: (_, _) => MaterialApp(
      home: const HomeView(),
      onGenerateRoute: AppRouter.onGenerate(),
      theme: const ThemeConfig().light,
      darkTheme: const ThemeConfig().dark,
      themeMode: getIt<SettingRepo>().getSetting().themeMode,
      debugShowCheckedModeBanner: false,
    ),
  );
}
