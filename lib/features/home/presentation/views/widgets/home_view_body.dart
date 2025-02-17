import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/presentation/managers/favorite_records/favorite_records_cubit.dart';
import 'package:spotify_app/features/home/presentation/managers/general_data_cubit/home_view_cubit.dart';
import 'package:spotify_app/features/home/presentation/managers/user_info_cubit/user_info_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/profile_view.dart';
import 'package:spotify_app/features/home/presentation/views/search_view.dart';
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
          onPressedPrefixIcon: () => AppNavigation.pushWithFadingAnimation(
              context: context, view: const SearchView()),
          onPressedProfileIcon: () {
            navigateToProfileView(context);
          },
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

  void navigateToProfileView(BuildContext context) {
    List<RecordModel> records =
        BlocProvider.of<GeneralDataCubit>(context).records;
    List<dynamic> favorites =
        BlocProvider.of<UserInfoCubit>(context).user.favorites!;
    BlocProvider.of<FavoriteRecordsCubit>(context)
        .fetchFavoriteRecords(favorites, records);
    AppNavigation.pushWithSlidingAnimation(
      context: context,
      view: const ProfileView(),
    );
  }
}
