import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import '../../../../../core/widgets/y_text.dart' show YText;
import '../../controllers/manage_books_cubit/manage_books_cubit.dart';
import 'book_card_list.dart';
import 'home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(_) => CustomScrollView(
    slivers: <Widget>[
      const HomeAppBar(),
      BlocBuilder<ManageBooksCubit, ManageBooksState>(
        builder: (final context, final state) {
          if (state is GetBooksSuccess) {
            final books = state.books;
            if (books.isEmpty) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: YText('No books found')),
              );
            }
            return BookCardList(
              books: books
                ..sort((final a, final b) => b.dueDate!.compareTo(a.dueDate!)),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    ],
  );
}
