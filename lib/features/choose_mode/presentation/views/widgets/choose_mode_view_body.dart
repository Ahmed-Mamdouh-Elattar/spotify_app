import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/views/register_or_sign_in_view.dart';

import 'package:spotify_app/features/choose_mode/presentation/views/widgets/choose_theme.dart';

class ChooseModeViewBody extends StatelessWidget {
  const ChooseModeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesPodcast),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.35),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 37,
                ),
                SvgPicture.asset(Assets.imagesLogo),
                const Spacer(),
                Text(
                  "Choose Mode",
                  style: AppTextStyle.styleBold22().copyWith(
                    color: const Color(0xffDADADA),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const ChooseTheme(),
                const SizedBox(
                  height: 70,
                ),
                CustomElevatedBudtton(
                  onPressed: () {
                    AppNavigation.pushWithSlidingAnimation(
                      context: context,
                      view: const RegisterOrSignInView(),
                    );
                  },
                  text: Text(
                    "Continue",
                    style: AppTextStyle.styleBold22().copyWith(
                      color: const Color(0xffF6F6F6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 69,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
