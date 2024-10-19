import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.color,
    this.centerWidget = const SizedBox(),
    this.showMenuIcon = false,
    this.onPressedMenuIcon,
    required this.prefixIcon,
    this.onPressedPrefixIcon,
  });
  final Color color;
  final IconData prefixIcon;
  final Widget centerWidget;
  final bool showMenuIcon;
  final void Function()? onPressedMenuIcon;
  final void Function()? onPressedPrefixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          color: color,
          icon: prefixIcon,
          onPressed: onPressedPrefixIcon,
        ),
        centerWidget,
        showMenuIcon
            ? IconButton(
                onPressed: onPressedMenuIcon,
                icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              )
            : const SizedBox(),
      ],
    );
  }
}
