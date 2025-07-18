part of '../entities/book_entity.dart';

final class BookAdapter extends TypeAdapter<BookEntity> {
  @override
  int get typeId => 0;

  @override
  BookEntity read(final BinaryReader reader) => BookModel.fromJson(
    Map<String, dynamic>.from(reader.readMap()),
  ).toEntity();

  @override
  void write(final BinaryWriter writer, final BookEntity obj) =>
      writer.writeMap(BookModel.fromEntity(obj).toJson());

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
