import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';

class RecordSliderWithTime extends StatelessWidget {
  const RecordSliderWithTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          inactiveColor: context.isDarkTheme
              ? const Color(0xff888888).withOpacity(0.3)
              : const Color(0xff000000).withOpacity(0.3),
          activeColor: context.isDarkTheme
              ? const Color(0xffB7B7B7)
              : const Color(0xff434343),
          value: 0,
          onChanged: (value) {},
          min: 0,
          max: 1000,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '00:00',
                style: AppTextStyle.styleMedium12(),
              ),
              Text(
                '04:45',
                style: AppTextStyle.styleMedium12(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
