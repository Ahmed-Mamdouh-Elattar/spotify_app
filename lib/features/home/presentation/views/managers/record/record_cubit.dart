import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordInitial());

  Duration recordDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  StreamSubscription<Duration>? _stateController;
  final _player = AudioPlayer();
  void recordPlay(String record) {
    _player.play(UrlSource(record));
    _stateController = _player.onPositionChanged.listen((currentPosition) {
      if (currentPosition == Duration.zero) {
        emit(RecordLoading());
      } else {
        _currentPosition = currentPosition;
        emit(RecordPlay(currentPosition: currentPosition));
      }
    });
  }

  void recordStop() async {
    _stateController!.pause();
    _player.pause();

    emit(RecordStop(currentPosition: _currentPosition));
  }

  void recordResume() async {
    _player.resume();

    _stateController!.resume;
  }

  void recordChangePosition(int seconds) async {
    if (state is RecordStop ||
        state is RecordInitial ||
        state is RecordLoading) {
      _currentPosition = Duration(seconds: seconds);
      emit(
        RecordStop(
          currentPosition: _currentPosition,
        ),
      );
    }
    _player.seek(Duration(seconds: seconds));
  }

  void recordLoad(String recordUrl) async {
    await _player.setSourceUrl(recordUrl);
    recordDuration = await _player.getDuration() ?? Duration.zero;
    emit(RecordLoading());
  }

  @override
  Future<void> close() async {
    await _stateController?.cancel();
    await _player.dispose();

    return super.close();
  }
}
