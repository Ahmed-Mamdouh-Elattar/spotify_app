import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';
import 'package:spotify_app/features/home/presentation/views/managers/general_data_cubit/home_view_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/general_item.dart';

class GeneralItemsList extends StatelessWidget {
  const GeneralItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralDataCubit, GeneralDataState>(
      builder: (context, state) {
        if (state is GeneralDataFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else if (state is GeneralDataSucceeded) {
          return SliverList.builder(
            itemCount: state.records.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                  bottom: 19, left: kPadding, right: kPadding),
              child: GeneralItem(
                record: state.records[index],
              ),
            ),
          );
        } else {
          return fakeListForLoading();
        }
      },
    );
  }

  SliverSkeletonizer fakeListForLoading() {
    return SliverSkeletonizer(
      child: SliverList.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
              bottom: 19, left: kPadding, right: kPadding),
          child: GeneralItem(
            record: RecordModel(
              type: "",
              image: "",
              recordUrl: "",
              title: "fake date for loading",
              personName: "fake data",
              duration: TimeDuration(hour: 1, minute: 22, second: 20),
            ),
          ),
        ),
      ),
    );
  }
}
