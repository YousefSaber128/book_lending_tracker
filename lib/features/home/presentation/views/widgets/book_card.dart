import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:intl/intl.dart';

import '../../../../../core/constants/borders.dart' show AppBorders;
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/helpers/add_book_dialog.dart' show setBookDialog;
import '../../../../../core/helpers/routes.dart';
import '../../../../../core/widgets/y_text.dart';
import '../../controllers/manage_books_cubit/manage_books_cubit.dart';

class BookCard extends StatelessWidget {
  const BookCard({required this.book, super.key});

  final BookEntity book;

  @override
  Widget build(final BuildContext context) => Card.filled(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.m),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () => setBookDialog(context, book: book),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: const Icon(Icons.book_rounded),
            title: YText('${book.title!} - ${book.author!}'),
            subtitle: YText(
              '${DateFormat('dd MMMM yyyy').format(book.dueDate!)} '
              'at ${DateFormat('h:mm a').format(book.dueDate!)}',
            ),
            trailing: IconButton.filledTonal(
              icon: const Icon(Icons.delete_rounded),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
                shape: const RoundedSuperellipseBorder(
                  borderRadius: AppBorders.xxs,
                ),
              ),
              onPressed: () => showAdaptiveDialog(
                context: context,
                builder: (_) => AlertDialog.adaptive(
                  title: const YText('Delete book'),
                  content: const YText(
                    'Are you sure you want to delete this book?',
                    softWrap: true,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => AppRouter.pop(context),
                      child: const YText('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await context.read<ManageBooksCubit>().delete(book);
                        if (context.mounted) {
                          AppRouter.pop(context);
                        }
                      },
                      child: const YText('Delete'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: YText(
              'Borrowed by ${book.borrower}',
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
