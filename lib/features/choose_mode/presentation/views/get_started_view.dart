import 'package:flutter/material.dart';
import 'package:spotify_app/features/choose_mode/presentation/views/widgets/get_started_view_body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GetStartedViewBody(),
      ),
    );
  }
}
