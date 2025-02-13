import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

part 'favorite_records_state.dart';

class FavoriteRecordsCubit extends Cubit<FavoriteRecordsState> {
  FavoriteRecordsCubit(this._homeRepoImp) : super(FavoriteRecordsInitial());
  final HomeRepoImp _homeRepoImp;
  void fetchFavoriteRecords(
      List<dynamic> favorites, List<RecordModel> records) {
    emit(FavoriteRecordsLoading());
    List<RecordModel> favoriteRecords =
        _homeRepoImp.fetchFavoriteRecordList(favorites, records);
    emit(FavoriteRecordsSuccess(records: favoriteRecords));
  }
}
