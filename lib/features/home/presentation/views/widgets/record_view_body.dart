import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/configs/app_color.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/presentation/managers/record/record_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/favourite_icon_button.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/record_slider_with_time.dart';

class RecordViewBody extends StatelessWidget {
  const RecordViewBody({required this.record, super.key});
  final RecordModel record;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Flexible(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Hero(
                    tag: record.id!,
                    child: SizedBox(
                      width: double.infinity,
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
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              record.title!,
                              maxLines: 2,
                              style: AppTextStyle.styleBold20(),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                record.personName!,
                                style: AppTextStyle.styleRegular20(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      FavouriteIconButton(recordModel: record),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Flexible(
          flex: 2,
          child: RecordSliderWithTime(),
        ),
        BlocBuilder<RecordCubit, RecordState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                if (state is RecordLoading) {
                  BlocProvider.of<RecordCubit>(context).recordPlay();
                } else if (state is RecordStop) {
                  BlocProvider.of<RecordCubit>(context).recordPlay();
                } else if (state is RecordPlay) {
                  BlocProvider.of<RecordCubit>(context).recordStop();
                }
              },
              padding: EdgeInsets.zero,
              icon: Container(
                height: 72,
                width: 72,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  state is RecordPlay ? Icons.pause : Icons.play_arrow,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}
