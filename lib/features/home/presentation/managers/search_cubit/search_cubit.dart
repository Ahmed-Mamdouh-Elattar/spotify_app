import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._homeRepoImp) : super(SearchInitial());

  final HomeRepoImp _homeRepoImp;

  void searchRecords(
      {required String recordTitle, required List<RecordModel> records}) {
    try {
      emit(SearchLoading());
      var data = _homeRepoImp.searchRecords(
          recordTitle: recordTitle, records: records);
      data.fold((errMessage) {
        emit(SearchFailure(errorMessage: errMessage));
      }, (records) {
        emit(SearchSucceeded(records: records));
      });
    } on Exception catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
