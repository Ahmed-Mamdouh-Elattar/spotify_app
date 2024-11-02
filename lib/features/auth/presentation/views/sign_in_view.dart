import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/utils/service_locator.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';
import 'package:spotify_app/features/auth/data/repo/auth_repo_imp.dart';
import 'package:spotify_app/features/auth/presentation/managers/sign_in/sign_in_cubit.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt.get<AuthRepoImp>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          onPressedPrefixIcon: () => AppNavigation.pop(context),
          prefixIcon: Icons.arrow_back_ios_new,
          showLogo: true,
        ),
        body: const SignInViewBody(),
      ),
    );
  }
}
