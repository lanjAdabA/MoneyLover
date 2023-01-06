// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:moneylover/AuthFlow/auth_flow.dart';
import 'package:moneylover/pages/account.page.dart';
import 'package:moneylover/pages/add.page.dart';
import 'package:moneylover/pages/home.page.dart';
import 'package:moneylover/pages/login.page.dart';
import 'package:moneylover/pages/mywalletseeall.page.dart';
import 'package:moneylover/pages/planning.page.dart';
import 'package:moneylover/pages/selectcategory.page.dart';
import 'package:moneylover/pages/transaction.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthFlowPage, initial: true, path: "/auto", children: [
      AutoRoute(page: HomePage),
      AutoRoute(page: SigninPage),
    ]),
    AutoRoute(page: TransactionPage),
    AutoRoute(page: AddPage),
    AutoRoute(page: PlanningPage),
    AutoRoute(page: AccountPage),
    AutoRoute(page: SelectionPage),
    AutoRoute(page: MyWalletsPage),
  ],
)
class $AppRouter {}
