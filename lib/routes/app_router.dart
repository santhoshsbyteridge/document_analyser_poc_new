import 'package:document_analyser_poc_new/routes/navbar_routes.dart';
import 'package:document_analyser_poc_new/screens/login_screen.dart';
import 'package:document_analyser_poc_new/screens/navBar/navbar_screen.dart';
import 'package:document_analyser_poc_new/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: AppHelpers.rootNavigatorKey,
    initialLocation: "/login",
    redirect: _guard,
    routes: [
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      ShellRoute(
        navigatorKey: AppHelpers.shellNavigatorKey,
        builder: (context, state, child) => NavBar(child: child),
        routes: navbarRoutes,
      ),
    ],
  );

  static String? _guard(BuildContext context, GoRouterState state) {
    print(state.fullPath);
    return null;
  }
}
