import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialPageRoute,
        Navigator,
        Route,
        RouteSettings,
        Widget,
        immutable;

import '../../features/home/presentation/views/home_view.dart' show HomeView;

@immutable
sealed class _Routes {
  const _Routes();

  static const String _home = '/home';
}

@immutable
sealed class _MapRoutes {
  const _MapRoutes();

  static final Map<String, Widget> _homeRoutes = <String, Widget>{
    _Routes._home: const HomeView(),
  };
}

@immutable
sealed class AppRouter {
  const AppRouter();

  static void pop<T extends Object?>(
    final BuildContext context, [
    final T? result,
  ]) => Navigator.pop<T>(context, result);

  // static Future<T?> _pushNamed<T extends Object?>(
  //   final BuildContext context,
  //   final String routeName, {
  //   final Object? arguments,
  // }) => Navigator.pushNamed<T>(context, routeName, arguments: arguments);

  // static Future<T?>
  // _pushReplacementNamed<T extends Object?, TO extends Object?>(
  //   final BuildContext context,
  //   final String routeName, {
  //   final TO? result,
  //   final Object? arguments,
  // }) => Navigator.pushReplacementNamed<T, TO>(
  //   context,
  //   routeName,
  //   result: result,
  //   arguments: arguments,
  // );

  static Route<dynamic>? Function(RouteSettings)? onGenerate() =>
      (final settings) => MaterialPageRoute(
        builder: (_) => _MapRoutes._homeRoutes[settings.name]!,
        settings: settings,
      );
}
