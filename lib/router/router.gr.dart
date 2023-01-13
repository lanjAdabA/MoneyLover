// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../AuthFlow/auth_flow.dart' as _i1;
import '../pages/account.page.dart' as _i5;
import '../pages/add.page.dart' as _i3;
import '../pages/allrecents.page.dart' as _i9;
import '../pages/home.page.dart' as _i11;
import '../pages/info.page.dart' as _i8;
import '../pages/login.page.dart' as _i12;
import '../pages/mywalletseeall.page.dart' as _i7;
import '../pages/planning.page.dart' as _i4;
import '../pages/selectcategory.page.dart' as _i6;
import '../pages/transaction.page.dart' as _i2;
import '../pages/updatetransaction.page.dart' as _i10;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AuthFlowRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthFlowPage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.TransactionPage(),
      );
    },
    AddRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AddPage(),
      );
    },
    PlanningRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PlanningPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AccountPage(),
      );
    },
    SelectionRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SelectionPage(),
      );
    },
    MyWalletsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.MyWalletsPage(),
      );
    },
    InfoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<InfoDetailRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.InfoDetailPage(
          key: args.key,
          transactionid: args.transactionid,
          categoryid: args.categoryid,
          categoryname: args.categoryname,
          amount: args.amount,
          date: args.date,
        ),
      );
    },
    AllRecentsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AllRecentsPage(),
      );
    },
    UpdateTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTransactionRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.UpdateTransactionPage(
          key: args.key,
          transactionid: args.transactionid,
          categoryid: args.categoryid,
          categoryname: args.categoryname,
          amount: args.amount,
          date: args.date,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.HomePage(),
      );
    },
    SigninRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.SigninPage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/auto',
          fullMatch: true,
        ),
        _i13.RouteConfig(
          AuthFlowRoute.name,
          path: '/auto',
          children: [
            _i13.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: AuthFlowRoute.name,
            ),
            _i13.RouteConfig(
              SigninRoute.name,
              path: 'signin-page',
              parent: AuthFlowRoute.name,
            ),
          ],
        ),
        _i13.RouteConfig(
          TransactionRoute.name,
          path: '/transaction-page',
        ),
        _i13.RouteConfig(
          AddRoute.name,
          path: '/add-page',
        ),
        _i13.RouteConfig(
          PlanningRoute.name,
          path: '/planning-page',
        ),
        _i13.RouteConfig(
          AccountRoute.name,
          path: '/account-page',
        ),
        _i13.RouteConfig(
          SelectionRoute.name,
          path: '/selection-page',
        ),
        _i13.RouteConfig(
          MyWalletsRoute.name,
          path: '/my-wallets-page',
        ),
        _i13.RouteConfig(
          InfoDetailRoute.name,
          path: '/info-detail-page',
        ),
        _i13.RouteConfig(
          AllRecentsRoute.name,
          path: '/all-recents-page',
        ),
        _i13.RouteConfig(
          UpdateTransactionRoute.name,
          path: '/update-transaction-page',
        ),
      ];
}

/// generated route for
/// [_i1.AuthFlowPage]
class AuthFlowRoute extends _i13.PageRouteInfo<void> {
  const AuthFlowRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AuthFlowRoute.name,
          path: '/auto',
          initialChildren: children,
        );

  static const String name = 'AuthFlowRoute';
}

/// generated route for
/// [_i2.TransactionPage]
class TransactionRoute extends _i13.PageRouteInfo<void> {
  const TransactionRoute()
      : super(
          TransactionRoute.name,
          path: '/transaction-page',
        );

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [_i3.AddPage]
class AddRoute extends _i13.PageRouteInfo<void> {
  const AddRoute()
      : super(
          AddRoute.name,
          path: '/add-page',
        );

  static const String name = 'AddRoute';
}

/// generated route for
/// [_i4.PlanningPage]
class PlanningRoute extends _i13.PageRouteInfo<void> {
  const PlanningRoute()
      : super(
          PlanningRoute.name,
          path: '/planning-page',
        );

  static const String name = 'PlanningRoute';
}

/// generated route for
/// [_i5.AccountPage]
class AccountRoute extends _i13.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: '/account-page',
        );

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i6.SelectionPage]
class SelectionRoute extends _i13.PageRouteInfo<void> {
  const SelectionRoute()
      : super(
          SelectionRoute.name,
          path: '/selection-page',
        );

  static const String name = 'SelectionRoute';
}

/// generated route for
/// [_i7.MyWalletsPage]
class MyWalletsRoute extends _i13.PageRouteInfo<void> {
  const MyWalletsRoute()
      : super(
          MyWalletsRoute.name,
          path: '/my-wallets-page',
        );

  static const String name = 'MyWalletsRoute';
}

/// generated route for
/// [_i8.InfoDetailPage]
class InfoDetailRoute extends _i13.PageRouteInfo<InfoDetailRouteArgs> {
  InfoDetailRoute({
    _i14.Key? key,
    required String transactionid,
    required String categoryid,
    required String categoryname,
    required int amount,
    required DateTime date,
  }) : super(
          InfoDetailRoute.name,
          path: '/info-detail-page',
          args: InfoDetailRouteArgs(
            key: key,
            transactionid: transactionid,
            categoryid: categoryid,
            categoryname: categoryname,
            amount: amount,
            date: date,
          ),
        );

  static const String name = 'InfoDetailRoute';
}

class InfoDetailRouteArgs {
  const InfoDetailRouteArgs({
    this.key,
    required this.transactionid,
    required this.categoryid,
    required this.categoryname,
    required this.amount,
    required this.date,
  });

  final _i14.Key? key;

  final String transactionid;

  final String categoryid;

  final String categoryname;

  final int amount;

  final DateTime date;

  @override
  String toString() {
    return 'InfoDetailRouteArgs{key: $key, transactionid: $transactionid, categoryid: $categoryid, categoryname: $categoryname, amount: $amount, date: $date}';
  }
}

/// generated route for
/// [_i9.AllRecentsPage]
class AllRecentsRoute extends _i13.PageRouteInfo<void> {
  const AllRecentsRoute()
      : super(
          AllRecentsRoute.name,
          path: '/all-recents-page',
        );

  static const String name = 'AllRecentsRoute';
}

/// generated route for
/// [_i10.UpdateTransactionPage]
class UpdateTransactionRoute
    extends _i13.PageRouteInfo<UpdateTransactionRouteArgs> {
  UpdateTransactionRoute({
    _i14.Key? key,
    required String transactionid,
    required String categoryid,
    required String categoryname,
    required int amount,
    required DateTime date,
  }) : super(
          UpdateTransactionRoute.name,
          path: '/update-transaction-page',
          args: UpdateTransactionRouteArgs(
            key: key,
            transactionid: transactionid,
            categoryid: categoryid,
            categoryname: categoryname,
            amount: amount,
            date: date,
          ),
        );

  static const String name = 'UpdateTransactionRoute';
}

class UpdateTransactionRouteArgs {
  const UpdateTransactionRouteArgs({
    this.key,
    required this.transactionid,
    required this.categoryid,
    required this.categoryname,
    required this.amount,
    required this.date,
  });

  final _i14.Key? key;

  final String transactionid;

  final String categoryid;

  final String categoryname;

  final int amount;

  final DateTime date;

  @override
  String toString() {
    return 'UpdateTransactionRouteArgs{key: $key, transactionid: $transactionid, categoryid: $categoryid, categoryname: $categoryname, amount: $amount, date: $date}';
  }
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.SigninPage]
class SigninRoute extends _i13.PageRouteInfo<void> {
  const SigninRoute()
      : super(
          SigninRoute.name,
          path: 'signin-page',
        );

  static const String name = 'SigninRoute';
}
