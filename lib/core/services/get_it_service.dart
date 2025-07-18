import 'package:get_it/get_it.dart' show GetIt;

import '../repositories/book_repository.dart'
    show BookRepository, BookRepositoryImplementation;
import '../repositories/setting_repo.dart'
    show SettingRepo, SettingRepoImplementation;
import 'hive_service.dart' show HiveService;
import 'local_database_service.dart' show LocalDatabaseService;

final GetIt getIt = GetIt.instance;

void getItSetup() {
  getIt
    ..registerLazySingleton<BookRepository>(
      () => const BookRepositoryImplementation(),
    )
    ..registerLazySingleton<SettingRepo>(
      () => const SettingRepoImplementation(),
    )
    ..registerLazySingleton<LocalDatabaseService>(() => const HiveService());
}
