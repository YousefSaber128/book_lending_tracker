import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

import '../../../../../core/entities/book_entity.dart' show BookEntity;
import '../../../../../core/repositories/book_repository.dart'
    show BookRepository;
import '../../../../../core/services/get_it_service.dart';

part 'manage_books_state.dart';

class ManageBooksCubit extends Cubit<ManageBooksState> {
  ManageBooksCubit() : super(const ManageBooksInitial()) {
    get();
  }

  Future<void> add(final BookEntity book) {
    emit(const ManageBooksLoading());
    return getIt<BookRepository>()
        .add(book)
        .then((_) => emit(AddBookSuccess(book)))
        .then((_) => get())
        .catchError((final e) => emit(AddBookFailure(e.toString())));
  }

  Future<void> update(final BookEntity book) {
    emit(const ManageBooksLoading());
    return getIt<BookRepository>()
        .update(book)
        .then((_) => emit(UpdateBookSuccess(book)))
        .then((_) => get())
        .catchError((final e) => emit(UpdateBookFailure(e.toString())));
  }

  void get() {
    emit(const ManageBooksLoading());
    final books = getIt<BookRepository>().getAll();
    emit(GetBooksSuccess(books));
  }

  Future<void> delete(final BookEntity book) {
    emit(const ManageBooksLoading());
    return getIt<BookRepository>()
        .delete(book)
        .then((_) => emit(DeleteBookSuccess(book)))
        .then((_) => get())
        .catchError((final e) => emit(DeleteBookFailure(e.toString())));
  }
}
