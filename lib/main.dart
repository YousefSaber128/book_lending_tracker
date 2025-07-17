import 'package:flutter/widgets.dart' show WidgetsFlutterBinding, runApp;
import 'core/entities/book_entity.dart' show BookAdapter;
import 'core/repositories/book_repository.dart' show BookRepository;
import 'core/services/get_it_service.dart' show getIt, getItSetup;
import 'core/services/local_database_service.dart' show LocalDatabaseService;
import 'main_app.dart' show MainApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getItSetup();

  await getIt<LocalDatabaseService>().init();

  getIt<LocalDatabaseService>().registerAdapter(BookAdapter());

  await getIt<BookRepository>().init();

  runApp(const MainApp());
}
