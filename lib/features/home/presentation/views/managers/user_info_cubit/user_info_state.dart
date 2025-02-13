import 'package:spotify_app/features/home/data/models/user_model/user_model.dart';

sealed class UserInfoState {
  final UserModel userInfo;

  const UserInfoState({required this.userInfo});
}

final class UserInfoInitial extends UserInfoState {
  const UserInfoInitial({required super.userInfo});
}

final class UserInfoNewRecords extends UserInfoState {
  const UserInfoNewRecords({required super.userInfo});
}
