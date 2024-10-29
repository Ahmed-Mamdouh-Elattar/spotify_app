import 'package:flutter/material.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/quran_and_podcast_item.dart';

class QuranAndPodcastList extends StatelessWidget {
  const QuranAndPodcastList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(right: 14),
          child: QuranAndPodcastItem(),
        );
      },
    );
  }
}
