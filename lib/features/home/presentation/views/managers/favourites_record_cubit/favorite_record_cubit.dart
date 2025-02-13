import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify_app/core/helper/get_user_id.dart';
import 'package:spotify_app/core/helper/record_favorites_function.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

part 'favorite_record_state.dart';

class FavoritesRecordCubit extends Cubit<FavoriteRecordState> {
  FavoritesRecordCubit(this._homeRepoImp)
      : super(
          FavoriteRecordInitial(
            newFavoriteRecords: [],
          ),
        );
  final HomeRepoImp _homeRepoImp;
  List<dynamic> favoriteRecords = [];
  void addRecordToFavorite(
      {required String id, required List<dynamic> favorites}) async {
    bool isRecordInFavorite =
        await RecordFavoritesFunction.checkIsRecordInFavourite(
      userId: await getUserId(),
      recordId: id,
      favorites: favorites,
    );
    if (isRecordInFavorite) {
      favoriteRecords.remove(id);
      emit(FavoriteRecordNewRecords(newFavoriteRecords: favoriteRecords));
    } else {
      favoriteRecords.add(id);
      emit(FavoriteRecordNewRecords(newFavoriteRecords: favoriteRecords));
    }
    await _homeRepoImp.addOrDeleteRecordFromFavorites(
        recordId: id, isRecordInFavourite: isRecordInFavorite);
  }

  void fetchFavoriteRecordList() async {
    favoriteRecords = await _homeRepoImp.fetchFavoriteRecords();
    emit(FavoriteRecordNewRecords(newFavoriteRecords: favoriteRecords));
  }
}
