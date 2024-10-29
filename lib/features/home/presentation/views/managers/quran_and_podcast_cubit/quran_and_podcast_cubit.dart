import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

part 'quran_and_podcast_state.dart';

class QuranAndPodcastCubit extends Cubit<QuranAndPodcastState> {
  QuranAndPodcastCubit(HomeRepoImp homeRepoImp)
      : _homeRepoImp = homeRepoImp,
        super(QuranAndPodcastInitial());
  final HomeRepoImp _homeRepoImp;
  void getQuranRecordsData() async {
    var data = await _homeRepoImp.getQuranRecordsData();
    data.fold((errMessage) {
      emit(QuranAndPodcastFailure(errMessage: errMessage));
    }, (records) {
      emit(QuranAndPodcastSucceeded(records: records));
    });
  }

  void getPodcastsRecordsData() async {
    var data = await _homeRepoImp.getPodcastsRecordsData();
    data.fold((errMessage) {
      emit(QuranAndPodcastFailure(errMessage: errMessage));
    }, (records) {
      emit(QuranAndPodcastSucceeded(records: records));
    });
  }
}
