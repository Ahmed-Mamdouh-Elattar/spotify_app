import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/views/register_view.dart';
import 'package:spotify_app/features/auth/presentation/views/sign_in_view.dart';

class ChooseRegisterOrSignIn extends StatelessWidget {
  const ChooseRegisterOrSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedBudtton(
            text: Text(
              "Register",
              style: AppTextStyle.styleMedium19().copyWith(),
            ),
            onPressed: () {
              AppNavigation.pushWithSlidingAnimation(
                context: context,
                view: const RegisterView(),
              );
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: CustomElevatedBudtton(
            onPressed: () {
              AppNavigation.pushWithSlidingAnimation(
                context: context,
                view: const SignInView(),
              );
            },
            color: Colors.transparent,
            text: Text(
              "Sign In",
              style: AppTextStyle.styleMedium19().copyWith(
                color: context.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
