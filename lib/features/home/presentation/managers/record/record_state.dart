part of 'record_cubit.dart';

sealed class RecordState {}

final class RecordInitial extends RecordState {}

final class RecordPlay extends RecordState {
  Duration currentPosition;
  RecordPlay({required this.currentPosition});
}

final class RecordStop extends RecordState {
  Duration currentPosition;
  RecordStop({required this.currentPosition});
}

final class RecordLoading extends RecordState {}
