import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import '../../../../../core/widgets/y_text.dart' show YText;
import '../../controllers/manage_books_cubit/manage_books_cubit.dart';
import 'book_card_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(_) => CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        title: const YText('Lending Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6_rounded),
            onPressed: () {},
          ),
        ],
      ),
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
            return BookCardList(books: books);
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
