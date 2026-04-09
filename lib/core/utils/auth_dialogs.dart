import 'package:flutter/material.dart';



void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green, // لون النجاح
      behavior: SnackBarBehavior.floating, // يجعلها تظهر بشكل عائم (أجمل)
      duration: const Duration(seconds: 3),
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red, // لون الخطأ
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "OK",
        textColor: Colors.white,
        onPressed: () {
          // يمكن تركها فارغة لإغلاق الـ SnackBar فقط
        },
      ),
    ),
  );
}