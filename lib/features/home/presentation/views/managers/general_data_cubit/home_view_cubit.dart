import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

part 'home_view_state.dart';

class GeneralDataCubit extends Cubit<GeneralDataState> {
  GeneralDataCubit(HomeRepoImp homeRepoImp)
      : _homeRepoImp = homeRepoImp,
        super(GeneralDataInitial());
  final HomeRepoImp _homeRepoImp;

  void getGeneralRecordsData(List<dynamic> favorites) async {
    var data = await _homeRepoImp.getGeneralRecordsData(favorites);
    data.fold((errMessage) {
      emit(GeneralDataFailure(errMessage: errMessage));
    }, (records) {
      emit(GeneralDataSucceeded(records: records));
    });
  }
}
