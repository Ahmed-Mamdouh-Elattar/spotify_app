import 'package:flutter/material.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/profile_view_body_item.dart';

class ProfileViewBodyList extends StatelessWidget {
  const ProfileViewBodyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: kPadding),
          child: const ProfileViewBodyItem(),
        );
      },
    );
  }
}
