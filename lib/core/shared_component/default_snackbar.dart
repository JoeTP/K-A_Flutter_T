import 'package:flutter/material.dart';

defaultSnackBar(BuildContext context, String message, {Color? bgColor}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
      ),
    );
