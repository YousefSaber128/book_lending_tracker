import 'package:hive_flutter/hive_flutter.dart' show TypeAdapter;

abstract interface class LocalDatabaseService {
  const LocalDatabaseService();

  Future<void> init();

  void registerAdapter<T>(final TypeAdapter<T> adapter);

  Future<void> openBox(final String collection);

  Future<void> add(
    final String collection,
    final String key,
    final Map<String, dynamic> value,
  );

  Future<void> update(
    final String collection,
    final String key,
    final Map<String, dynamic> value,
  );

  Map<String, dynamic>? getDocument(final String collection, final String key);

  List<Map<String, dynamic>?> getDocuments(
    final String collection,
    final List<String> key,
  );

  List<Map<String, dynamic>> getCollection(final String collection);

  Future<void> delete(final String collection, final String key);

  Future<void> clear(final String collection);
}
