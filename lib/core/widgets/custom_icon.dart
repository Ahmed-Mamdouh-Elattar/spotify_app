import 'package:flutter/material.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key, required this.color, this.onPressed, required this.icon});
  final Color color;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: context.isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
