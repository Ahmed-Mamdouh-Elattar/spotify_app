import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify_app/core/helper/get_user_id.dart';
import 'package:spotify_app/core/helper/record_favorites_function.dart';
import 'package:spotify_app/features/home/data/models/user_model/user_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';
import 'package:spotify_app/features/home/presentation/views/managers/user_info_cubit/user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._homeRepoImp)
      : super(
          UserInfoInitial(
              userInfo: UserModel(
            email: "",
            name: "",
            favorites: [],
          )),
        );
  final HomeRepoImp _homeRepoImp;
  UserModel user = UserModel(email: "", name: "", favorites: []);
  Future<void> addRecordToFavorite(
      {required String id, required List<dynamic> favorites}) async {
    bool isRecordInFavorite =
        await RecordFavoritesFunction.checkIsRecordInFavourite(
      userId: await getUserId(),
      recordId: id,
      favorites: favorites,
    );
    if (isRecordInFavorite) {
      user.favorites.remove(id);
      emit(UserInfoNewRecords(userInfo: user));
    } else {
      user.favorites.add(id);
      emit(UserInfoNewRecords(userInfo: user));
    }
    await _homeRepoImp.addOrDeleteRecordFromFavorites(
        recordId: id, isRecordInFavourite: isRecordInFavorite);
  }

  void fetchFavoriteRecordList() async {
    user = await _homeRepoImp.fetchUserInfo();
    emit(UserInfoNewRecords(userInfo: user));
  }
}
