import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar(BuildContext context, Widget content, Color bgcolor,
      {SnackBarAction? snackBarAction}) {
    final SnackBar snackBar = SnackBar(
      content: content,
      elevation: 10,
      action: snackBarAction,
      backgroundColor: bgcolor,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
