import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/presentation/managers/favorite_records/favorite_records_cubit.dart';
import 'package:spotify_app/features/home/presentation/managers/general_data_cubit/home_view_cubit.dart';
import 'package:spotify_app/features/home/presentation/managers/user_info_cubit/user_info_cubit.dart';
import 'package:spotify_app/features/home/presentation/managers/user_info_cubit/user_info_state.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({
    required this.recordModel,
    super.key,
  });
  final RecordModel recordModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            await BlocProvider.of<UserInfoCubit>(context).addRecordToFavorite(
                id: recordModel.id!, favorites: state.userInfo.favorites!);
            if (context.mounted) {
              List<RecordModel> records =
                  BlocProvider.of<GeneralDataCubit>(context).records;
              List<dynamic> favorites = state.userInfo.favorites!;
              BlocProvider.of<FavoriteRecordsCubit>(context)
                  .fetchFavoriteRecords(favorites, records);
            }
          },
          icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
              child: Icon(
                key: ValueKey<bool>(
                    state.userInfo.favorites!.contains(recordModel.id)),
                state.userInfo.favorites!.contains(recordModel.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: state.userInfo.favorites!.contains(recordModel.id)
                    ? Colors.red
                    : Colors.grey,
              )),
          iconSize: 30,
        );
      },
    );
  }
}
