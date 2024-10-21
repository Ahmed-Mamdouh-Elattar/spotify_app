import 'package:flutter/material.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInViewBody(),
      ),
    );
  }
}