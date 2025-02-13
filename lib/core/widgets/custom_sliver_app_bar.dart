import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/widgets/custom_icon.dart';

class CustomSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSliverAppBar(
      {required this.prefixIcon,
      super.key,
      this.centerWidget,
      this.showMenuIcon = false,
      this.onPressedProfileIcon,
      this.onPressedPrefixIcon});
  final IconData prefixIcon;
  final Widget? centerWidget;
  final bool showMenuIcon;
  final void Function()? onPressedProfileIcon;
  final void Function()? onPressedPrefixIcon;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      floating: true,
      centerTitle: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomIcon(
          color: context.isDarkTheme
              ? Colors.white.withAlpha((0.03 * 255).toInt())
              : const Color(0xff000000).withAlpha((0.04 * 255).toInt()),
          icon: prefixIcon,
          onPressed: onPressedPrefixIcon,
        ),
      ),
      title: SizedBox(
        height: kToolbarHeight * 0.75,
        child: centerWidget,
      ),
      actions: [
        showMenuIcon
            ? IconButton(
                onPressed: onPressedProfileIcon,
                icon: Icon(
                  FontAwesomeIcons.house,
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
