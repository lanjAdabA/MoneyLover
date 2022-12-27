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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/add.page.dart' as _i3;
import '../pages/home.page.dart' as _i1;
import '../pages/transaction.page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.TransactionPage(),
      );
    },
    Addpage.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.Addpage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          TransactionRoute.name,
          path: '/transaction-page',
        ),
        _i4.RouteConfig(
          Addpage.name,
          path: '/Addpage',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.TransactionPage]
class TransactionRoute extends _i4.PageRouteInfo<void> {
  const TransactionRoute()
      : super(
          TransactionRoute.name,
          path: '/transaction-page',
        );

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [_i3.Addpage]
class Addpage extends _i4.PageRouteInfo<void> {
  const Addpage()
      : super(
          Addpage.name,
          path: '/Addpage',
        );

  static const String name = 'Addpage';
}
