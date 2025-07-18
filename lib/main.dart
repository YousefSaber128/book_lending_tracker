import 'package:flutter/widgets.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'core/repositories/book_repository.dart' show BookRepository;
import 'core/repositories/setting_repo.dart' show SettingRepo;
import 'core/services/get_it_service.dart' show getIt, getItSetup;
import 'core/services/local_database_service.dart' show LocalDatabaseService;
import 'features/home/presentation/controllers/theme_mode_changer_cubit/theme_mode_changer_cubit.dart'
    show ThemeModeChangerCubit;
import 'main_app.dart' show MainApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getItSetup();

  await getIt<LocalDatabaseService>().init();

  getIt<BookRepository>().registerAdapter();

  getIt<SettingRepo>().registerAdapter();

  await getIt<BookRepository>().init();

  await getIt<SettingRepo>().init();

  runApp(
    BlocProvider(
      create: (_) => ThemeModeChangerCubit(),
      child: const MainApp(),
    ),
  );
}
