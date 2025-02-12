import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/format_duration.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/features/home/presentation/views/managers/record/record_cubit.dart';

class RecordSliderWithTime extends StatelessWidget {
  const RecordSliderWithTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordCubit, RecordState>(
      builder: (context, state) {
        Duration recordDuration =
            BlocProvider.of<RecordCubit>(context).recordDuration;

        return Column(
          children: [
            Slider(
              inactiveColor: context.isDarkTheme
                  ? const Color(0xff888888).withAlpha((0.3 * 255).toInt())
                  : const Color(0xff000000).withAlpha((0.3 * 255).toInt()),
              activeColor: context.isDarkTheme
                  ? const Color(0xffB7B7B7)
                  : const Color(0xff434343),
              value: state is RecordPlay
                  ? state.currentPosition.inSeconds.toDouble()
                  : state is RecordStop
                      ? state.currentPosition.inSeconds.toDouble()
                      : 0,
              onChanged: (value) {
                BlocProvider.of<RecordCubit>(context)
                    .recordChangePosition(value.toInt());
              },
              min: 0,
              max: recordDuration.inSeconds.toDouble(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state is RecordPlay
                        ? formatDuration(state.currentPosition)
                        : state is RecordStop
                            ? formatDuration(state.currentPosition)
                            : formatDuration(Duration.zero),
                    style: AppTextStyle.styleMedium12(),
                  ),
                  Text(
                    formatDuration(recordDuration),
                    style: AppTextStyle.styleMedium12(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
