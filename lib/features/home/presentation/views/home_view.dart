import 'package:flutter/material.dart' show Scaffold, StatelessWidget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

import '../controllers/manage_books_cubit/manage_books_cubit.dart'
    show ManageBooksCubit;
import 'widgets/add_book_f_a_b.dart';
import 'widgets/home_view_body.dart' show HomeViewBody;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  BlocProvider build(_) => BlocProvider<ManageBooksCubit>(
    create: (_) => ManageBooksCubit(),
    child: const Scaffold(
      body: HomeViewBody(),
      floatingActionButton: AddBookFAB(),
    ),
  );
}
