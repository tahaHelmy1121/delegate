import 'package:flutter/material.dart';

showErrorConnection({required BuildContext context, var error}) {
 return  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error: $error'),
      duration: const Duration(seconds: 2),
    ),
  );
}
