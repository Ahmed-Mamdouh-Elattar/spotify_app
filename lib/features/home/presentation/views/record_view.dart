import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/core/widgets/custom_app_bar.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/record_view_body.dart';

class RecordView extends StatelessWidget {
  const RecordView({
    required this.record,
    super.key,
  });
  final RecordModel record;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        prefixIcon: Icons.arrow_back_ios_new,
        onPressedPrefixIcon: () => AppNavigation.pop(context),
      ),
      body: RecordViewBody(
        record: record,
      ),
    );
  }
}
