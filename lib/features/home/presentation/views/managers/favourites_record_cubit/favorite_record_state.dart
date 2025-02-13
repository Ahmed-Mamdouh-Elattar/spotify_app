part of 'favorite_record_cubit.dart';

sealed class FavoriteRecordState {
  final List<dynamic> newFavoriteRecords;

  const FavoriteRecordState({required this.newFavoriteRecords});
}

final class FavoriteRecordInitial extends FavoriteRecordState {
  const FavoriteRecordInitial({required super.newFavoriteRecords});
}

final class FavoriteRecordNewRecords extends FavoriteRecordState {
  const FavoriteRecordNewRecords({required super.newFavoriteRecords});
}
