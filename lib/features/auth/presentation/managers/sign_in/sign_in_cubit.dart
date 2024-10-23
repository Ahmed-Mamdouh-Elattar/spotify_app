import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify_app/features/auth/data/repo/auth_repo_imp.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(AuthRepoImp authRepoImp)
      : _authRepoImp = authRepoImp,
        super(SignInInitial());
  final AuthRepoImp _authRepoImp;
  void signInUser({required String email, required String password}) async {
    emit(SignInLoading());
    var result = await _authRepoImp.signIn(
      email: email,
      password: password,
    );
    result.fold((errMessage) {
      emit(SignInFailure(errMessage: errMessage));
    }, (unit) {
      emit(SignInSucceeded());
    });
  }

  void signInValidateMode() {
    emit(SignInValidateMode());
  }
}
