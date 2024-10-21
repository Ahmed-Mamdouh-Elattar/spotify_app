import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
            "Register",
            style: AppTextStyle.styleBold30(),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomTextFormField(
            hintText: "Full Name",
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: "Enter Email",
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
              "Create Account",
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
                "Do You Have An Account?",
                style: AppTextStyle.styleMedium14(),
              ),
              TextButton(
                onPressed: () {
                  AppNavigation.pushReplacement(
                    context: context,
                    view: const SignInView(),
                  );
                },
                child: Text(
                  "Sign In",
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
