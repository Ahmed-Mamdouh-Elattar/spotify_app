import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/views/register_view.dart';
import 'package:spotify_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          CustomAppBar(
            onPressedPrefixIcon: () => AppNavigation.pop(context),
            prefixIcon: Icons.arrow_back_ios_new,
            centerWidget: SizedBox(
              height: 33,
              child: SvgPicture.asset(Assets.imagesLogo),
            ),
          ),
          const SizedBox(
            height: 47,
          ),
          Text(
            "Sign In",
            style: AppTextStyle.styleBold30(),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomTextFormField(
            hintText: "Enter Username Or Email",
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: "Password",
          ),
          const SizedBox(
            height: 33,
          ),
          CustomElevatedBudtton(
            onPressed: () {},
            text: Text(
              "Sign In",
              style: AppTextStyle.styleBold20(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "Not A Member?",
                style: AppTextStyle.styleMedium14(),
              ),
              TextButton(
                onPressed: () {
                  AppNavigation.pushReplacement(
                    context: context,
                    view: const RegisterView(),
                  );
                },
                child: Text(
                  "Register Now",
                  style: AppTextStyle.styleBold15()
                      .copyWith(color: const Color(0xff288CE9)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
