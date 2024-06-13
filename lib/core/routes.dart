import 'package:go_router/go_router.dart';
import 'package:to_do_app/screen/client/home.dart';
// import 'package:to_do_app/screen/static/settings.dart';

final routes = GoRouter(
  // errorBuilder: (context, state) => const ErorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // GoRoute(
    //   path: 'settings',
    //   builder: (context, state) => const SettingScreen(),
    // ),
  ],
);
