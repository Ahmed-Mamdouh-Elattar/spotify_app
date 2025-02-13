import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/constants.dart';

import 'package:spotify_app/features/home/presentation/views/widgets/profile_appbar_with_user_info.dart';

import 'package:spotify_app/features/home/presentation/views/widgets/profile_view_body_list.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const ProfileAppBarWithUserInfo(),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: kPadding),
                  child: Text(
                    "Favorites",
                    style: AppTextStyle.styleBold18(),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
            ],
          ),
        ),
        const ProfileViewBodyList()
      ],
    );
  }
}
