import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:spotify_app/core/configs/app_text_style.dart';

import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/show_snack_bar.dart';
import 'package:spotify_app/core/helper/validate_email.dart';
import 'package:spotify_app/core/helper/validate_password.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';

import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/managers/sign_in/sign_in_cubit.dart';
import 'package:spotify_app/features/auth/presentation/views/register_view.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/ask_with_text_button.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:spotify_app/features/home/presentation/views/home_view.dart';
import 'package:spotify_app/features/home/presentation/managers/user_info_cubit/user_info_cubit.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async {
        if (state is SignInFailure) {
          showSnackBar(context, content: state.errMessage);
        } else if (state is SignInSucceeded) {
          await BlocProvider.of<UserInfoCubit>(context)
              .fetchUserInfo(email: email);
          if (context.mounted) {
            AppNavigation.pushAndRemoveAllWithFadingAnimation(
              context: context,
              view: const HomeView(),
            );
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Form(
              key: formKey,
              autovalidateMode: state.autovalidateMode,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                    CustomTextFormField(
                      hintText: "Enter Email",
                      validator: (email) {
                        return validateEmail(email);
                      },
                      onSaved: (email) {
                        this.email = email!;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordTextFormField(
                      validator: (password) {
                        return validatePassword(password);
                      },
                      onSaved: (password) {
                        this.password = password!;
                      },
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    CustomElevatedBudtton(
                      text: Text(
                        "Sign In",
                        style: AppTextStyle.styleBold20(),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<SignInCubit>(context).signInUser(
                            email: email,
                            password: password,
                          );
                        } else {
                          BlocProvider.of<SignInCubit>(context)
                              .signInValidateMode();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AskWithTextButton(
                      askContent: "Not A Member?",
                      textButtonContent: "Register Now",
                      onPressed: () {
                        AppNavigation.pushReplacementWithFadingAnimation(
                          context: context,
                          view: const RegisterView(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
