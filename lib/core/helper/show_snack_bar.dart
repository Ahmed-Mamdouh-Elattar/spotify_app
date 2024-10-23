import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_color.dart';

void showSnackBar(BuildContext context, {required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColor.primaryColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Colors.red,
        ),
      ),
      elevation: 20,
    ),
  );
}
