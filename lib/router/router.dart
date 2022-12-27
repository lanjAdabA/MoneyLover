// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:moneylover/pages/add.page.dart';
import 'package:moneylover/pages/home.page.dart';
import 'package:moneylover/pages/transaction.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: TransactionPage),
    AutoRoute(page: Addpage),
  ],
)
class $AppRouter {}
