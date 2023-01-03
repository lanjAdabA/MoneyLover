import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneylover/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Google_Login {
  saveuid(uid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", uid.toString());
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User user = result.user!;
    saveuid(user.uid);

    context.router.push(const AuthFlowRoute());
  }

  Future google_sign_out() async {
    try {
      return await _googleSignIn.signOut();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
