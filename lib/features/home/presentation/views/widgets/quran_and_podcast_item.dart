import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/home_play_icon_button.dart';

class QuranAndPodcastItem extends StatelessWidget {
  const QuranAndPodcastItem({super.key});

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
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                          "https://mediaaws.almasryalyoum.com/news/verylarge/2015/01/24/297049_0.jpg",
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(30),
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
          child: Column(
            children: [
              Text(
                "Bad Guy",
                style: AppTextStyle.styleBold16(),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Bilie Elish",
                style: AppTextStyle.styleRegular14(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
