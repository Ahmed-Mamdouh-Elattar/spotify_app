import 'package:flutter/material.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';

import 'package:spotify_app/features/home/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkTheme
          ? const Color(0xff1C1B1B)
          : const Color(0xffFAFAFA),
      body: const SafeArea(child: ProfileViewBody()),
    );
  }
}
