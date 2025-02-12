import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("state : $change");
  }

  @override
  void onClose(BlocBase bloc) {
    log("$bloc");
  }

  @override
  void onCreate(BlocBase bloc) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
