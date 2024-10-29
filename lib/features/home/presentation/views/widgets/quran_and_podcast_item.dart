import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/home_play_icon_button.dart';

class QuranAndPodcastItem extends StatelessWidget {
  const QuranAndPodcastItem({super.key, required this.record});
  final RecordModel record;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AspectRatio(
                aspectRatio: 0.79,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: record.image!,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const Positioned(
                top: 155,
                left: 100,
                child: HomePlayIconButton(),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.title!,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.styleBold16(),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  record.personName!,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.styleRegular14(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
