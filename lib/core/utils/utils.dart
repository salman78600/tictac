import 'package:flutter/material.dart';

void snackbar(
  BuildContext context,
  String message, {
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color ?? Colors.red,
      duration: const Duration(seconds: 2),
    ),
  );
}
