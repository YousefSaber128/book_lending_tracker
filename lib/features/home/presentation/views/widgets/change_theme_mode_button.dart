import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import '../../controllers/theme_mode_changer_cubit/theme_mode_changer_cubit.dart';

class ChangeThemeModeButton extends StatelessWidget {
  const ChangeThemeModeButton({super.key});

  @override
  Widget build(_) => BlocBuilder<ThemeModeChangerCubit, ThemeModeChangerState>(
    builder: (final context, _) => IconButton.filledTonal(
      icon: const Icon(Icons.brightness_3_rounded),
      tooltip: 'Change Theme',
      selectedIcon: const Icon(Icons.brightness_7_rounded),
      isSelected: Theme.of(context).brightness == Brightness.dark,
      onPressed: () =>
          context.read<ThemeModeChangerCubit>().toggleTheme(context),
    ),
  );
}
