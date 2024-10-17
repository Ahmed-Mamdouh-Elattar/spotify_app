import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/features/choose_mode/presentation/views/get_started_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToGetStartedView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(Assets.imagesLogo),
      ),
    );
  }

  Future<void> navigateToGetStartedView() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (mounted) {
      AppNavigation.pushWithFadingAnimation(
        transitionDuratio: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        context: context,
        view: const GetStartedView(),
      );
    }
  }
}
