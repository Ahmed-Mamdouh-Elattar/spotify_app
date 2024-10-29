import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/custom_tab_bar.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/general_items_list.dart';

import 'package:spotify_app/features/home/presentation/views/widgets/home_card.dart';
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
        const GeneralItemsList(),
      ],
    );
  }
}
