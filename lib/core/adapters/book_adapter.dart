part of '../entities/book_entity.dart';

final class BookAdapter extends TypeAdapter<BookEntity> {
  @override
  int get typeId => 0;

  @override
  BookEntity read(final BinaryReader reader) {
    final json = reader.readMap().map<String, dynamic>(
      (final key, final value) => MapEntry(key, value),
    );
    return BookModel.fromJson(json).toEntity();
  }

  @override
  void write(final BinaryWriter writer, final BookEntity obj) {
    final json = BookModel.fromEntity(obj).toJson();
    return writer.writeMap(json);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
