part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSucceeded extends SearchState {
  List<RecordModel> records;

  SearchSucceeded({required this.records});
}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
