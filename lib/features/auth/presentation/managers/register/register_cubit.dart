import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify_app/features/auth/data/repo/auth_repo_imp.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(AuthRepoImp authRepoImp)
      : _authRepoImp = authRepoImp,
        super(RegisterInitial());
  final AuthRepoImp _authRepoImp;
  void registerUser({required String email, required String password}) async {
    emit(RegisterLoading());
    var result = await _authRepoImp.register(
      email: email,
      password: password,
    );
    result.fold((errMessage) {
      emit(RegisterFailure(errMessage: errMessage));
    }, (unit) {
      emit(RegisterSucceeded());
    });
  }

  void registerValidateMode() {
    emit(RegisterValidateMode());
  }
}
