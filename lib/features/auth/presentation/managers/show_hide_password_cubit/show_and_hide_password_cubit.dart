import 'package:hydrated_bloc/hydrated_bloc.dart';

class ShowAndHidePasswordCubit extends Cubit<bool> {
  ShowAndHidePasswordCubit() : super(true);
  bool _isVisible = true;
  void showAndHidePassword() {
    _isVisible = !_isVisible;
    emit(_isVisible);
  }
}
