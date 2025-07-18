import 'package:flutter/material.dart'
    show
        AlertDialog,
        BuildContext,
        Column,
        Form,
        FormState,
        GlobalKey,
        MainAxisSize,
        TextButton,
        TextEditingController,
        TextInputAction,
        TextInputType,
        showAdaptiveDialog;
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

import '../../features/home/presentation/controllers/manage_books_cubit/manage_books_cubit.dart'
    show ManageBooksCubit;
import '../entities/book_entity.dart' show BookEntity;
import '../widgets/app_text_field.dart' show AppTextField;
import '../widgets/y_text.dart' show YText;
import 'id_generators/text_id_generator.dart' show TextIdGenerator;
import 'routes.dart' show AppRouter;

Future<void> setBookDialog(
  final BuildContext context, {
  final BookEntity? book,
}) => showAdaptiveDialog(
  context: context,
  builder: (_) {
    final titleController = TextEditingController(text: book?.title);
    final authorController = TextEditingController(text: book?.author);
    final borrowerController = TextEditingController(text: book?.borrower);
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: AlertDialog.adaptive(
        title: YText(book != null ? 'Update Book' : 'Add Book'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: titleController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onSaved: (final value) => titleController.text = value ?? '',
              validator: (final value) {
                if (value?.isNotEmpty ?? false) {
                  return null;
                }
                return 'Please enter a title';
              },
              labelText: 'Title',
            ),
            AppTextField(
              controller: authorController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onSaved: (final value) => authorController.text = value ?? '',
              validator: (final value) {
                if (value?.isNotEmpty ?? false) {
                  return null;
                }
                return 'Please enter an author';
              },
              labelText: 'Author',
            ),
            AppTextField(
              controller: borrowerController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              onSaved: (final value) => borrowerController.text = value ?? '',
              validator: (final value) {
                if (value?.isNotEmpty ?? false) {
                  return null;
                }
                return 'Please enter a borrower';
              },
              labelText: 'Borrower',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => AppRouter.pop(context),
            child: const YText('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState?.save();
                final b = BookEntity(
                  id:
                      book?.id ??
                      TextIdGenerator(titleController.text).generateId(),
                  title: titleController.text,
                  author: authorController.text,
                  borrower: borrowerController.text,
                  dueDate: book?.dueDate ?? DateTime.now(),
                );
                if (book != null) {
                  await context.read<ManageBooksCubit>().update(b);
                } else {
                  await context.read<ManageBooksCubit>().add(b);
                }
                if (context.mounted) {
                  AppRouter.pop(context);
                }
              }
            },
            child: YText(book != null ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  },
);
