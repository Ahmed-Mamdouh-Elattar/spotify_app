import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/profile_view_appbar.dart';

class ProfileAppBarWithUserInfo extends StatelessWidget {
  const ProfileAppBarWithUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      decoration: BoxDecoration(
        color: context.isDarkTheme ? const Color(0xff2C2B2B) : Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const ProfileViewAppBar(),
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(Assets.imagesLogo),
          const SizedBox(
            height: 15,
          ),
          Text(
            "andkjxanbkj@gmail.com",
            style: AppTextStyle.styleRegular17(),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Ahmed Mamdouh",
            style: AppTextStyle.styleBold20(),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
