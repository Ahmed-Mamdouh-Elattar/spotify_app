import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/forma_time.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';

class ProfileViewBodyItem extends StatelessWidget {
  const ProfileViewBodyItem({
    required this.recordModel,
    super.key,
  });
  final RecordModel recordModel;
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
                    imageUrl: recordModel.image!,
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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Text(
                      recordModel.title!,
                      style: AppTextStyle.styleBold16(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    recordModel.personName!,
                    style: AppTextStyle.styleRegular12(),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                formatTime(recordModel.duration),
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
