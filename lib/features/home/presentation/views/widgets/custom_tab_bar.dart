import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/configs/app_color.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/features/home/presentation/views/managers/quran_and_podcast_cubit/quran_and_podcast_cubit.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabBarController;
  @override
  void initState() {
    tabBarController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabBarController,
      dividerColor: Colors.transparent,
      labelColor: context.isDarkTheme ? Colors.white : Colors.black,
      labelStyle: AppTextStyle.styleMedium20(),
      unselectedLabelColor: context.isDarkTheme
          ? const Color(0xff616161)
          : const Color(0xffBEBEBE),
      indicatorColor: AppColor.primaryColor,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
      onTap: (value) {
        if (value == 0) {
          BlocProvider.of<QuranAndPodcastCubit>(context).getQuranRecordsData();
        } else {
          BlocProvider.of<QuranAndPodcastCubit>(context)
              .getPodcastsRecordsData();
        }
      },
      tabs: const [
        Text(
          "Quran",
        ),
        Text(
          "Podcasts",
        ),
      ],
    );
  }
}
