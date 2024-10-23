part of 'sign_in_cubit.dart';

sealed class SignInState {
  bool isLoading;
  AutovalidateMode autovalidateMode;
  SignInState(this.isLoading, this.autovalidateMode);
}

final class SignInInitial extends SignInState {
  SignInInitial() : super(false, AutovalidateMode.disabled);
}

final class SignInLoading extends SignInState {
  SignInLoading() : super(true, AutovalidateMode.always);
}

final class SignInSucceeded extends SignInState {
  SignInSucceeded() : super(false, AutovalidateMode.always);
}

final class SignInFailure extends SignInState {
  SignInFailure({required this.errMessage})
      : super(false, AutovalidateMode.always);
  String errMessage;
}

final class SignInValidateMode extends SignInState {
  SignInValidateMode() : super(false, AutovalidateMode.always);
}
