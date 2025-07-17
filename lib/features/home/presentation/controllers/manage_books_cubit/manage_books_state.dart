part of 'manage_books_cubit.dart';

@immutable
sealed class ManageBooksState {
  const ManageBooksState();
}

final class ManageBooksInitial extends ManageBooksState {
  const ManageBooksInitial();
}

final class ManageBooksLoading extends ManageBooksState {
  const ManageBooksLoading();
}

final class AddBookSuccess extends ManageBooksState {
  const AddBookSuccess(this.book);
  final BookEntity book;
}

final class AddBookFailure extends ManageBooksState {
  const AddBookFailure(this.message);
  final String message;
}

final class UpdateBookSuccess extends ManageBooksState {
  const UpdateBookSuccess(this.book);
  final BookEntity book;
}

final class UpdateBookFailure extends ManageBooksState {
  const UpdateBookFailure(this.message);
  final String message;
}

final class GetBooksSuccess extends ManageBooksState {
  const GetBooksSuccess(this.books);
  final List<BookEntity> books;
}

final class GetBooksFailure extends ManageBooksState {
  const GetBooksFailure(this.message);
  final String message;
}

final class DeleteBookSuccess extends ManageBooksState {
  const DeleteBookSuccess(this.book);
  final BookEntity book;
}

final class DeleteBookFailure extends ManageBooksState {
  const DeleteBookFailure(this.message);
  final String message;
}
