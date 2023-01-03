import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneylover/logic/auth_flow/cubit/auth_flow_cubit.dart';
import 'package:moneylover/router/router.gr.dart';

class AuthFlowPage extends StatefulWidget {
  const AuthFlowPage({super.key});

  @override
  State<AuthFlowPage> createState() => _AuthFlowState();
}

class _AuthFlowState extends State<AuthFlowPage> {
  @override
  void initState() {
    context.read<AuthFlowCubit>().getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AuthFlowCubit>().state;
    final status = s.status;

    return AutoRouter.declarative(routes: (context) {
      log(status.toString());
      switch (status) {
        case LoginStatus.initial:
          return [];
        case LoginStatus.login:
          return [const HomeRoute()];
        case LoginStatus.logout:
          return [const SigninRoute()];
      }
    });
  }
}
