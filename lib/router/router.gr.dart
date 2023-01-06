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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../AuthFlow/auth_flow.dart' as _i1;
import '../pages/account.page.dart' as _i5;
import '../pages/add.page.dart' as _i3;
import '../pages/home.page.dart' as _i8;
import '../pages/login.page.dart' as _i9;
import '../pages/mywalletseeall.page.dart' as _i7;
import '../pages/planning.page.dart' as _i4;
import '../pages/selectcategory.page.dart' as _i6;
import '../pages/transaction.page.dart' as _i2;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthFlowRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthFlowPage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.TransactionPage(),
      );
    },
    AddRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AddPage(),
      );
    },
    PlanningRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PlanningPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AccountPage(),
      );
    },
    SelectionRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SelectionPage(),
      );
    },
    MyWalletsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.MyWalletsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    SigninRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.SigninPage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/auto',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          AuthFlowRoute.name,
          path: '/auto',
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: AuthFlowRoute.name,
            ),
            _i10.RouteConfig(
              SigninRoute.name,
              path: 'signin-page',
              parent: AuthFlowRoute.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          TransactionRoute.name,
          path: '/transaction-page',
        ),
        _i10.RouteConfig(
          AddRoute.name,
          path: '/add-page',
        ),
        _i10.RouteConfig(
          PlanningRoute.name,
          path: '/planning-page',
        ),
        _i10.RouteConfig(
          AccountRoute.name,
          path: '/account-page',
        ),
        _i10.RouteConfig(
          SelectionRoute.name,
          path: '/selection-page',
        ),
        _i10.RouteConfig(
          MyWalletsRoute.name,
          path: '/my-wallets-page',
        ),
      ];
}

/// generated route for
/// [_i1.AuthFlowPage]
class AuthFlowRoute extends _i10.PageRouteInfo<void> {
  const AuthFlowRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthFlowRoute.name,
          path: '/auto',
          initialChildren: children,
        );

  static const String name = 'AuthFlowRoute';
}

/// generated route for
/// [_i2.TransactionPage]
class TransactionRoute extends _i10.PageRouteInfo<void> {
  const TransactionRoute()
      : super(
          TransactionRoute.name,
          path: '/transaction-page',
        );

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [_i3.AddPage]
class AddRoute extends _i10.PageRouteInfo<void> {
  const AddRoute()
      : super(
          AddRoute.name,
          path: '/add-page',
        );

  static const String name = 'AddRoute';
}

/// generated route for
/// [_i4.PlanningPage]
class PlanningRoute extends _i10.PageRouteInfo<void> {
  const PlanningRoute()
      : super(
          PlanningRoute.name,
          path: '/planning-page',
        );

  static const String name = 'PlanningRoute';
}

/// generated route for
/// [_i5.AccountPage]
class AccountRoute extends _i10.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: '/account-page',
        );

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i6.SelectionPage]
class SelectionRoute extends _i10.PageRouteInfo<void> {
  const SelectionRoute()
      : super(
          SelectionRoute.name,
          path: '/selection-page',
        );

  static const String name = 'SelectionRoute';
}

/// generated route for
/// [_i7.MyWalletsPage]
class MyWalletsRoute extends _i10.PageRouteInfo<void> {
  const MyWalletsRoute()
      : super(
          MyWalletsRoute.name,
          path: '/my-wallets-page',
        );

  static const String name = 'MyWalletsRoute';
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.SigninPage]
class SigninRoute extends _i10.PageRouteInfo<void> {
  const SigninRoute()
      : super(
          SigninRoute.name,
          path: 'signin-page',
        );

  static const String name = 'SigninRoute';
}
