import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/presentation/views/managers/record/record_cubit.dart';

void checkIfNewRecordAndLoadIt(RecordModel record, BuildContext context) {
  var recordId = BlocProvider.of<RecordCubit>(context).recordId;
  if (record.id != recordId) {
    BlocProvider.of<RecordCubit>(context).recordLoad(record);
  }
}
