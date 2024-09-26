import 'package:flutter/material.dart';


// function to show error messages to user
showErrorMessage(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}
