import 'package:flutter/material.dart';

import '../../../../../core/widgets/y_text.dart' show YText;
import 'change_theme_mode_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(_) => const SliverAppBar(
    title: YText('Lending Tracker'),
    actions: [ChangeThemeModeButton()],
  );
}
