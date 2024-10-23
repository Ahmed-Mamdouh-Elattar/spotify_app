import 'package:flutter/material.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/register_or_sign_in_view_body.dart';

class RegisterOrSignInView extends StatelessWidget {
  const RegisterOrSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        prefixIcon: Icons.arrow_back_ios_new,
        onPressedPrefixIcon: () {
          AppNavigation.pop(context);
        },
      ),
      body: const RegisterOrSignInViewBody(),
    );
  }
}
