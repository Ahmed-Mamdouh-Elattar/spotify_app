import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.prefixIcon,
      this.centerWidget,
      this.showMenuIcon = false,
      this.onPressedMenuIcon,
      this.onPressedPrefixIcon});
  final IconData prefixIcon;
  final Widget? centerWidget;
  final bool showMenuIcon;
  final void Function()? onPressedMenuIcon;
  final void Function()? onPressedPrefixIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
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
      title: centerWidget,
      actions: [
        showMenuIcon
            ? IconButton(
                onPressed: onPressedMenuIcon,
                icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
