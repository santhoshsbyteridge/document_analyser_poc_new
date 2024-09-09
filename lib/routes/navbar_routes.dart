import 'package:document_analyser_poc_new/screens/navBar/customers/call_customer_screen.dart';
import 'package:document_analyser_poc_new/screens/navBar/customers/customers_screen.dart';
import 'package:document_analyser_poc_new/screens/navBar/dashboard_screen.dart';
import 'package:document_analyser_poc_new/utils/app_helpers.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> navbarRoutes = [
  GoRoute(
    path: "/dashboard",
    name: "dashboard",
    builder: (context, state) {
      return const DashboardPage();
    },
  ),
  ShellRoute(
    navigatorKey: AppHelpers.shellNavigatorKey,
    builder: (context, state, child) => CustomersPage(child: child),
    routes: [
      GoRoute(
        path: '/call-customer',
        name: "call-customer",
        builder: (context, state) => const CallCustomerPage(),
      ),
    ],
  ),
];
