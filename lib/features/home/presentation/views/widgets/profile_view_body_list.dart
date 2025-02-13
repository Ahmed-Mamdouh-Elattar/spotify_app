import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/create_fake_record_model.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/features/home/presentation/views/managers/favorite_records/favorite_records_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/record_view.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/profile_view_body_item.dart';

class ProfileViewBodyList extends StatelessWidget {
  const ProfileViewBodyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteRecordsCubit, FavoriteRecordsState>(
        builder: (context, state) {
      if (state is FavoriteRecordsSuccess) {
        if (state.records.isNotEmpty) {
          return SliverList.builder(
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              return MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () => AppNavigation.pushWithSlidingAnimation(
                  context: context,
                  view: RecordView(
                    record: state.records[index],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: ProfileViewBodyItem(
                    recordModel: state.records[index],
                  ),
                ),
              );
            },
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                "No Favorites",
                style: AppTextStyle.styleMedium17(),
              ),
            ),
          );
        }
      } else {
        return fakeListForLoading();
      }
    });
  }

  SliverSkeletonizer fakeListForLoading() {
    return SliverSkeletonizer(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: ProfileViewBodyItem(
                  recordModel: createFakeRecordModel(),
                ),
              )),
    );
  }
}
