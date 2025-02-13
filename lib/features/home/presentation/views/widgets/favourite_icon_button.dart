import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';

import 'package:spotify_app/features/home/presentation/views/managers/favourites_record_cubit/favorite_record_cubit.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({
    super.key,
    required this.recordModel,
  });
  final RecordModel recordModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesRecordCubit, FavoriteRecordState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<FavoritesRecordCubit>(context).addRecordToFavorite(
                id: recordModel.id!, favorites: state.newFavoriteRecords);
          },
          icon: state.newFavoriteRecords.contains(recordModel.id)
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_border_outlined),
          iconSize: 30,
        );
      },
    );
  }
}
