import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';

import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_icon.dart';

class ProfileViewAppBar extends StatelessWidget {
  const ProfileViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(children: [
        CustomIcon(
          color: context.isDarkTheme
              ? Colors.white.withAlpha((0.1 * 255).toInt())
              : const Color(0xffFFFFFF).withAlpha((0.04 * 255).toInt()),
          icon: Icons.arrow_back_ios_new,
          onPressed: () => AppNavigation.pop(context),
        ),
        const Spacer(),
        Text(
          "Profile",
          style: AppTextStyle.styleBold17(),
        ),
        const Spacer(),
        const SizedBox(),
      ]),
    );
  }
}
