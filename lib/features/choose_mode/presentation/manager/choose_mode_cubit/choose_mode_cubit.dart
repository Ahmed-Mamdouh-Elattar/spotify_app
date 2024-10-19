import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ChooseModeCubit extends HydratedCubit<ThemeMode> {
  ChooseModeCubit() : super(ThemeMode.system);
  void chooseMode({required ThemeMode themeMode}) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    ThemeMode mode =
        json["mode"] == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark;
    return mode;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {"mode": state.name};
  }
}
