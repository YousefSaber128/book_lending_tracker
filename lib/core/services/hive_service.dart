import 'package:hive_flutter/hive_flutter.dart'
    show Box, Hive, HiveX, TypeAdapter;
import 'local_database_service.dart' show LocalDatabaseService;

final class HiveService implements LocalDatabaseService {
  const HiveService();

  Box<Map<String, dynamic>> _box(final String collection) =>
      Hive.box<Map<String, dynamic>>(collection);

  @override
  Future<void> init() => Hive.initFlutter();

  @override
  void registerAdapter<T>(final TypeAdapter<T> adapter) =>
      Hive.registerAdapter<T>(adapter);

  @override
  Future<void> open(final String collection) =>
      Hive.openBox<Map<String, dynamic>>(collection);

  @override
  Future<void> add(
    final String collection,
    final String key,
    final Map<String, dynamic> value,
  ) => _box(collection).put(key, value);

  @override
  Future<void> update(
    final String collection,
    final String key,
    final Map<String, dynamic> value,
  ) => _box(collection).put(key, value);

  @override
  Map<String, dynamic>? getDocument(
    final String collection,
    final String key,
  ) => _box(collection).get(key);

  @override
  List<Map<String, dynamic>?> getDocuments(
    final String collection,
    final List<String> keys,
  ) => keys.map((final key) => _box(collection).get(key)).toList();

  @override
  List<Map<String, dynamic>> getCollection(final String collection) =>
      _box(collection).values.toList();

  @override
  Future<void> delete(final String collection, final String key) =>
      _box(collection).delete(key);

  @override
  Future<void> clear(final String collection) => _box(collection).clear();
}
