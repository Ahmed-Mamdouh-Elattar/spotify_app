import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_color.dart';

class CustomElevatedBudtton extends StatelessWidget {
  const CustomElevatedBudtton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = AppColor.primaryColor,
  });
  final void Function()? onPressed;
  final Text text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size.fromHeight(65),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}
