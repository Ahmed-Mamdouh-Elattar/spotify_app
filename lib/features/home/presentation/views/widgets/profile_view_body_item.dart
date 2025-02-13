import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';

class ProfileViewBodyItem extends StatelessWidget {
  const ProfileViewBodyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://th.bing.com/th/id/OIP.ijbuCfVcht86JvmlTB8UFgHaJ8?rs=1&pid=ImgDetMain",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "dont smile at me",
                    style: AppTextStyle.styleBold16(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Billie Eilish",
                    style: AppTextStyle.styleRegular12(),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "5:33",
                style: AppTextStyle.styleBold15(),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
