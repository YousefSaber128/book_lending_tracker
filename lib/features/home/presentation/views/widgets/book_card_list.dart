import 'package:flutter/material.dart';

import '../../../../../core/entities/book_entity.dart';
import 'book_card.dart';

class BookCardList extends StatelessWidget {
  const BookCardList({required this.books, super.key});
  final List<BookEntity> books;

  @override
  Widget build(_) => SliverList.builder(
    itemBuilder: (_, final index) => BookCard(book: books[index]),
    itemCount: books.length,
  );
}
