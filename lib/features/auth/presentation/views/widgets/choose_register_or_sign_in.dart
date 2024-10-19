import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';

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
              style: AppTextStyle.styleMedium19().copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: CustomElevatedBudtton(
            onPressed: () {},
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
