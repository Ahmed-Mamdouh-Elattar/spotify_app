import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/choose_mode/presentation/views/choose_mode_view.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesAlafasy),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          color: Colors.blueGrey.withAlpha((0.2 * 255).toInt()),
        ),
        Container(
          color: Colors.black.withAlpha((0.3 * 255).toInt()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              children: [
                const SizedBox(
                  height: 37,
                ),
                SvgPicture.asset(Assets.imagesLogo),
                const Spacer(),
                Text(
                  textAlign: TextAlign.center,
                  "Listen To Quran And Podcasts",
                  style: AppTextStyle.styleBold25().copyWith(
                    color: const Color(0xffDADADA),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "There are many voices read Quran that you can listen to them. There are also useful podcasts that you can benefit and learn from them.",
                  style: AppTextStyle.styleRegular17().copyWith(
                    color: Colors.white38,
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
                CustomElevatedBudtton(
                  onPressed: () {
                    AppNavigation.pushWithSlidingAnimation(
                      context: context,
                      view: const ChooseModeView(),
                    );
                  },
                  text: Text(
                    "Get Started",
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
        )
      ],
    );
  }
}
