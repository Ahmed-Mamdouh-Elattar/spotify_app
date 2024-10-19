import 'package:flutter/material.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/register_or_sign_in_view_body.dart';

class RegisterOrSignInView extends StatelessWidget {
  const RegisterOrSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RegisterOrSignInViewBody(),
      ),
    );
  }
}
