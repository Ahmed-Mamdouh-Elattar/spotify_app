part of 'quran_and_podcast_cubit.dart';

sealed class QuranAndPodcastState {}

final class QuranAndPodcastInitial extends QuranAndPodcastState {}

final class QuranAndPodcastFailure extends QuranAndPodcastState {
  final String errMessage;

  QuranAndPodcastFailure({required this.errMessage});
}

final class QuranAndPodcastSucceeded extends QuranAndPodcastState {
  final List<RecordModel> records;

  QuranAndPodcastSucceeded({required this.records});
}

final class QuranAndPodcastLoading extends QuranAndPodcastState {}
