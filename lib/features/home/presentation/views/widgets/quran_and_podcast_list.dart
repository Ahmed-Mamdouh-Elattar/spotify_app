import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spotify_app/core/helper/check_if_new_record_and_load_it.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';
import 'package:spotify_app/features/home/presentation/views/managers/quran_and_podcast_cubit/quran_and_podcast_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/record_view.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/quran_and_podcast_item.dart';

class QuranAndPodcastList extends StatelessWidget {
  const QuranAndPodcastList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAndPodcastCubit, QuranAndPodcastState>(
      builder: (context, state) {
        if (state is QuranAndPodcastFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is QuranAndPodcastSucceeded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    checkIfNewRecordAndLoadIt(state.records[index], context);
                    AppNavigation.pushWithSlidingAnimation(
                      context: context,
                      view: RecordView(
                        record: state.records[index],
                      ),
                    );
                  },
                  child: QuranAndPodcastItem(
                    record: state.records[index],
                  ),
                ),
              );
            },
          );
        } else {
          return Skeletonizer(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: QuranAndPodcastItem(
                    record: RecordModel(
                      id: "",
                      type: "type",
                      image: "https://fakeimg.pl/250x100/",
                      recordUrl: "recordUrl",
                      title: "title",
                      personName: "personName",
                      duration: TimeDuration(hour: 1, minute: 2, second: 3),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
