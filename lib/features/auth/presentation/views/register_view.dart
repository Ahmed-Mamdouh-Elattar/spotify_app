import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/utils/service_locator.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';
import 'package:spotify_app/features/auth/data/repo/auth_repo_imp.dart';
import 'package:spotify_app/features/auth/presentation/managers/register/register_cubit.dart';
import 'package:spotify_app/features/auth/presentation/managers/show_hide_password_cubit/show_and_hide_password_cubit.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            getIt.get<AuthRepoImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => ShowAndHidePasswordCubit(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          onPressedPrefixIcon: () => AppNavigation.pop(context),
          prefixIcon: Icons.arrow_back_ios_new,
          centerWidget: SizedBox(
            height: 33,
            child: SvgPicture.asset(Assets.imagesLogo),
          ),
        ),
        body: const RegisterViewBody(),
      ),
    );
  }
}
