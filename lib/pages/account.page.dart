import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moneylover/pages/googlesignin.page.dart';
import 'package:moneylover/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  log("logout");
                  prefs.remove("uid").whenComplete(() {
                    Google_Login().google_sign_out();
                    context.router.push(const AuthFlowRoute());
                  });
                },
                label: const Text(
                  "Log_out",
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          )
        ],
      ),
    );
  }
}
