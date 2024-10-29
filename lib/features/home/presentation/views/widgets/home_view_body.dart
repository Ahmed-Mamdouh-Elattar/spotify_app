import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/custom_tab_bar.dart';

import 'package:spotify_app/features/home/presentation/views/widgets/home_card.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/home_play_icon_button.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/quran_and_podcast_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          prefixIcon: FontAwesomeIcons.magnifyingGlass,
          centerWidget: SvgPicture.asset(Assets.imagesLogo),
          showMenuIcon: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const HomeCard(),
                const SizedBox(
                  height: 40,
                ),
                const CustomTabBar(),
                const SizedBox(
                  height: 28,
                ),
                const SizedBox(
                  height: 242,
                  child: QuranAndPodcastList(),
                ),
                const SizedBox(
                  height: 37,
                ),
                Text(
                  "General",
                  style: AppTextStyle.styleBold20(),
                ),
                const SizedBox(
                  height: 23,
                ),
              ],
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 6,
          itemBuilder: (context, index) => const Padding(
            padding:
                EdgeInsets.only(bottom: 19, left: kPadding, right: kPadding),
            child: GeneralItem(),
          ),
        ),
      ],
    );
  }
}

class GeneralItem extends StatelessWidget {
  const GeneralItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HomePlayIconButton(
          height: 37,
          width: 37,
        ),
        const SizedBox(
          width: 23,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "As It Was",
              style: AppTextStyle.styleBold16(),
            ),
            Text(
              "Harry Styles",
              style: AppTextStyle.styleRegular12(),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "5:23",
          style: AppTextStyle.styleRegular15().copyWith(
              color: context.isDarkTheme
                  ? const Color(0xffD6D6D6)
                  : const Color(0xff000000)),
        ),
        const Spacer(),
        GestureDetector(
          child: context.isDarkTheme
              ? SvgPicture.asset(Assets.imagesFavouriteDark)
              : SvgPicture.asset(Assets.imagesFavouriteLight),
        )
      ],
    );
  }
}
