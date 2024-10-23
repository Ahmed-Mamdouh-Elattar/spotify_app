part of 'register_cubit.dart';

sealed class RegisterState {
  RegisterState(this.isLoading, this.autovalidateMode);
  bool isLoading;
  AutovalidateMode? autovalidateMode;
}

final class RegisterInitial extends RegisterState {
  RegisterInitial() : super(false, AutovalidateMode.disabled);
}

final class RegisterLoading extends RegisterState {
  RegisterLoading() : super(true, AutovalidateMode.always);
}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure({required this.errMessage})
      : super(false, AutovalidateMode.always);
}

final class RegisterSucceeded extends RegisterState {
  RegisterSucceeded() : super(false, AutovalidateMode.always);
}

final class RegisterValidateMode extends RegisterState {
  RegisterValidateMode() : super(false, AutovalidateMode.always);
}
