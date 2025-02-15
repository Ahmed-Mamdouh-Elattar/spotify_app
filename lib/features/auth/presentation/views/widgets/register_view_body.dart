import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/get_user_id.dart';
import 'package:spotify_app/core/helper/show_snack_bar.dart';
import 'package:spotify_app/core/helper/validate_email.dart';
import 'package:spotify_app/core/helper/validate_name.dart';
import 'package:spotify_app/core/helper/validate_password.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/managers/register/register_cubit.dart';
import 'package:spotify_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/ask_with_text_button.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:spotify_app/features/home/presentation/views/home_view.dart';
import 'package:spotify_app/features/home/presentation/views/managers/user_info_cubit/user_info_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  late String email, password, name;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state is RegisterFailure) {
          showSnackBar(context, content: state.errMessage);
        } else if (state is RegisterSucceeded) {
          await fetchUserData(context);
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
                      "Register",
                      style: AppTextStyle.styleBold30(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      hintText: "Full Name",
                      validator: (value) {
                        return validataName(value);
                      },
                      onSaved: (name) {
                        this.name = name!;
                      },
                    ),
                    const SizedBox(
                      height: 16,
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
                        "Create Account",
                        style: AppTextStyle.styleBold20(),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          BlocProvider.of<RegisterCubit>(context).registerUser(
                            email: email,
                            password: password,
                            name: name,
                          );
                        } else {
                          BlocProvider.of<RegisterCubit>(context)
                              .registerValidateMode();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AskWithTextButton(
                      askContent: "Do You Have An Account",
                      textButtonContent: "Sign In",
                      onPressed: () {
                        AppNavigation.pushReplacementWithFadingAnimation(
                          context: context,
                          view: const SignInView(),
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

  Future<void> fetchUserData(BuildContext context) async {
    if (await getUserId() != "null") {
      if (context.mounted) {
        await BlocProvider.of<UserInfoCubit>(context).fetchUserInfo();
      }
    }
  }
}
