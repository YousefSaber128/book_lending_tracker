import 'package:flutter/material.dart'
    show FloatingActionButton, Icon, Icons, StatelessWidget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import '../../../../../core/helpers/add_book_dialog.dart';
import '../../../../../core/widgets/y_text.dart' show YText;
import '../../controllers/manage_books_cubit/manage_books_cubit.dart'
    show ManageBooksCubit, ManageBooksState;

class AddBookFAB extends StatelessWidget {
  const AddBookFAB({super.key});

  @override
  BlocBuilder build(_) => BlocBuilder<ManageBooksCubit, ManageBooksState>(
    builder: (final context, final state) => FloatingActionButton.extended(
      onPressed: () => setBookDialog(context),
      label: const YText('Add Book'),
      icon: const Icon(Icons.add_rounded),
    ),
  );
}
