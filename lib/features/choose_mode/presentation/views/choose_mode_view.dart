import 'package:flutter/material.dart';
import 'package:spotify_app/features/choose_mode/presentation/views/widgets/choose_mode_view_body.dart';

class ChooseModeView extends StatelessWidget {
  const ChooseModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ChooseModeViewBody(),
      ),
    );
  }
}
