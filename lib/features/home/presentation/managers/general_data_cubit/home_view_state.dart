part of 'home_view_cubit.dart';

sealed class GeneralDataState {}

final class GeneralDataInitial extends GeneralDataState {}

final class GeneralDataSucceeded extends GeneralDataState {
  final List<RecordModel> records;

  GeneralDataSucceeded({required this.records});
}

final class GeneralDataFailure extends GeneralDataState {
  final String errMessage;
  GeneralDataFailure({required this.errMessage});
}

final class GeneralDataLoading extends GeneralDataState {}
