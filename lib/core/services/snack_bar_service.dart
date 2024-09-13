import 'package:flutter/material.dart';

abstract class SnackBarService {
  static Future<void> showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
        content: Text(
      message,
    ));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
