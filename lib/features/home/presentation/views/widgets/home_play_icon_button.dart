import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';

class HomePlayIconButton extends StatelessWidget {
  const HomePlayIconButton({
    super.key,
    this.onPressed,
    this.height = 29,
    this.width = 29,
  });
  final void Function()? onPressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      icon: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDarkTheme
              ? const Color(0xff2C2C2C)
              : const Color(0xffE6E6E6),
        ),
        child: Center(
          child: context.isDarkTheme
              ? SvgPicture.asset(Assets.imagesPlayDark)
              : SvgPicture.asset(Assets.imagesPlayLight),
        ),
      ),
    );
  }
}
