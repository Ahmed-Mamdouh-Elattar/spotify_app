import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';

import 'package:spotify_app/features/auth/presentation/views/widgets/choose_register_or_sign_in.dart';

class RegisterOrSignInViewBody extends StatelessWidget {
  const RegisterOrSignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(Assets.imagesTopCurvedLines),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(Assets.imagesBottomCurvedLines),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                prefixIcon: Icons.arrow_back_ios_new,
                onPressedPrefixIcon: () {
                  AppNavigation.pop(context);
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imagesLogo),
                    const SizedBox(
                      height: 55,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Enjoy listening to music",
                      style: AppTextStyle.styleBold26(),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Spotify is a proprietary Swedish audio streaming and media services provider",
                      style: AppTextStyle.styleRegular17(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const ChooseRegisterOrSignIn(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
