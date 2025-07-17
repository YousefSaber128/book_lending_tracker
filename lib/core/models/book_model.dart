import '../entities/book_entity.dart' show BookEntity;

final class BookModel extends BookEntity {
  const BookModel({
    super.id,
    super.title,
    super.author,
    super.borrower,
    super.dueDate,
  });

  factory BookModel.fromEntity(final BookEntity entity) => BookModel(
    id: entity.id,
    title: entity.title,
    author: entity.author,
    borrower: entity.borrower,
    dueDate: entity.dueDate,
  );

  factory BookModel.fromJson(final Map<String, dynamic> json) => BookModel(
    id: json['id'],
    title: json['title'],
    author: json['author'],
    borrower: json['borrower'],
    dueDate: json['dueDate'],
  );

  BookEntity toEntity() => BookEntity(
    id: id,
    title: title,
    author: author,
    borrower: borrower,
    dueDate: dueDate,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'borrower': borrower,
    'dueDate': dueDate,
  };
}
