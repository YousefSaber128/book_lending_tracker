import '../constants/hive_keys.dart' show HiveKeys;
import '../entities/book_entity.dart' show BookAdapter, BookEntity;
import '../models/book_model.dart';
import '../services/get_it_service.dart' show getIt;
import '../services/local_database_service.dart';

sealed class BookRepository {
  const BookRepository();

  void registerAdapter();

  Future<void> init();

  Future<void> add(final BookEntity book);

  Future<void> update(final BookEntity book);

  List<BookEntity> getAll();

  Future<void> delete(final BookEntity book);

  Future<void> clear();
}

final class BookRepositoryImplementation implements BookRepository {
  const BookRepositoryImplementation();

  static final LocalDatabaseService _localDatabaseService =
      getIt<LocalDatabaseService>();

  static const String _collection = HiveKeys.books;

  @override
  void registerAdapter() =>
      _localDatabaseService.registerAdapter<BookEntity>(BookAdapter());

  @override
  Future<void> init() => _localDatabaseService.openBox(_collection);

  @override
  Future<void> add(final BookEntity book) => _localDatabaseService.add(
    _collection,
    book.id!,
    BookModel.fromEntity(book).toJson(),
  );

  @override
  Future<void> update(final BookEntity book) => _localDatabaseService.update(
    _collection,
    book.id!,
    BookModel.fromEntity(book).toJson(),
  );

  @override
  List<BookEntity> getAll() => _localDatabaseService
      .getCollection(_collection)
      .map((final e) => BookModel.fromJson(e).toEntity())
      .toList();

  @override
  Future<void> delete(final BookEntity book) =>
      _localDatabaseService.delete(_collection, book.id!);

  @override
  Future<void> clear() => _localDatabaseService.clear(_collection);
}
