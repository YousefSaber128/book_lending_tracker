import 'package:get_it/get_it.dart' show GetIt;

import '../repositories/book_repository.dart'
    show BookRepository, BookRepositoryImplementation;
import 'hive_service.dart' show HiveService;
import 'local_database_service.dart' show LocalDatabaseService;

final GetIt getIt = GetIt.instance;

void getItSetup() {
  getIt
    ..registerLazySingleton<BookRepository>(
      () => const BookRepositoryImplementation(),
    )
    ..registerLazySingleton<LocalDatabaseService>(() => const HiveService());
}
