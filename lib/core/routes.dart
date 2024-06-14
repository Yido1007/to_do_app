import 'package:go_router/go_router.dart';
import 'package:to_do_app/screen/client/languages.dart';
import 'package:to_do_app/screen/core/theme.dart';
import 'package:to_do_app/widgets/hidden_drawer.dart';
// import 'package:to_do_app/screen/static/settings.dart';

final routes = GoRouter(
  // errorBuilder: (context, state) => const ErorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HiddenDrawer(),
    ),
    GoRoute(
      path: '/themes',
      builder: (context, state) => const ThemeScreen(),
    ),
    GoRoute(
      path: '/language',
      builder: (context, state) => const LanguageScreen(),
    ),
  ],
);
