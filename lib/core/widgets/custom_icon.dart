import 'package:flutter/material.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    required this.color,
    required this.icon,
    super.key,
    this.onPressed,
  });
  final Color color;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: FittedBox(
            child: Icon(
              icon,
              color: context.isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
