import 'package:hive_flutter/hive_flutter.dart'
    show BinaryReader, BinaryWriter, TypeAdapter;
import 'package:meta/meta.dart';

import '../models/book_model.dart' show BookModel;
part '../adapters/book_adapter.dart';

@immutable
base class BookEntity {
  const BookEntity({
    this.id,
    this.title,
    this.author,
    this.borrower,
    this.dueDate,
  });
  final String? id;
  final String? title;
  final String? author;
  final String? borrower;
  final DateTime? dueDate;

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is BookEntity &&
        other.id == id &&
        other.title == title &&
        other.author == author &&
        other.borrower == borrower &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      borrower.hashCode ^
      dueDate.hashCode;

  @override
  String toString() =>
      'BookEntity(id: $id, title: $title, author: $author, '
      'borrower: $borrower, dueDate: $dueDate)';
}
