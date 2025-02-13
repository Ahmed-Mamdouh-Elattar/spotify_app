import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/favourite_icon_button.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/home_play_icon_button.dart';

class GeneralItem extends StatelessWidget {
  const GeneralItem({super.key, required this.record});
  final RecordModel record;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HomePlayIconButton(
          height: 37,
          width: 37,
        ),
        const SizedBox(
          width: 23,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Text(
                record.title ?? "",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.styleBold16(),
              ),
            ),
            Text(
              record.personName ?? "",
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.styleRegular12(),
            ),
          ],
        ),
        const Spacer(),
        Text(
          formatTime(record.duration),
          style: AppTextStyle.styleRegular15().copyWith(
              color: context.isDarkTheme
                  ? const Color(0xffD6D6D6)
                  : const Color(0xff000000)),
        ),
        const Spacer(),
        FavouriteIconButton(
          recordModel: record,
        ),
      ],
    );
  }
}

String formatTime(TimeDuration duration) {
  num? hour = duration.hour;
  num? minute = duration.minute;
  num? second = duration.second;
  String format(num? time) => time == null
      ? ""
      : time < 10
          ? '0$time'
          : '$time';

  String formattedHour = format(hour);
  String formattedMinute = format(minute);
  String formattedSecond = format(second);

  return '${formattedHour.isEmpty ? "" : "$formattedHour:"}${formattedMinute.isEmpty ? "00:" : "$formattedMinute:"}${formattedSecond.isEmpty ? "" : formattedSecond}';
}
