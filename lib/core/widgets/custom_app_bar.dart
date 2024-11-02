import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.prefixIcon,
    this.centerWidget,
    this.showMenuIcon = false,
    this.onPressedMenuIcon,
    this.onPressedPrefixIcon,
    this.showLogo = false,
  });
  final IconData prefixIcon;
  final Widget? centerWidget;
  final bool showMenuIcon;
  final void Function()? onPressedMenuIcon;
  final void Function()? onPressedPrefixIcon;
  final bool showLogo;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomIcon(
          color: context.isDarkTheme
              ? Colors.white.withOpacity(0.03)
              : const Color(0xff000000).withOpacity(0.04),
          icon: prefixIcon,
          onPressed: onPressedPrefixIcon,
        ),
      ),
      title: showLogo
          ? SizedBox(
              height: kToolbarHeight * 0.75,
              child: SvgPicture.asset(Assets.imagesLogo),
            )
          : centerWidget,
      actions: [
        showMenuIcon
            ? IconButton(
                onPressed: onPressedMenuIcon,
                icon: Icon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: context.isDarkTheme
                      ? const Color(0xffDDDDDD)
                      : const Color(0xff7D7D7D),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
