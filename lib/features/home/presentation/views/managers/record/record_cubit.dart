import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:just_audio_background/just_audio_background.dart';
import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordInitial());
  String recordId = "";
  Duration recordDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  StreamSubscription<Duration>? _stateController;

  final _player = AudioPlayer();
  void recordPlay() {
    _player.play();
    _stateController = _player.positionStream.listen(_updateCurrentPosition);
  }

  void _updateCurrentPosition(currentPosition) async {
    if (currentPosition == recordDuration) {
      _currentPosition = Duration.zero;
      await _player.seek(_currentPosition);
      recordStop();
    } else if (!_player.playing) {
      emit(RecordStop(currentPosition: _currentPosition));
    } else {
      _currentPosition = currentPosition;
      emit(RecordPlay(currentPosition: currentPosition));
    }
  }

  void recordStop() async {
    _stateController!.pause();
    _player.pause();

    emit(RecordStop(currentPosition: _currentPosition));
  }

  void recordResume() async {
    _player.load();

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

  void recordLoad(RecordModel record) async {
    recordId = record.id!;
    _stateController?.cancel();
    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(record.recordUrl!),
          tag: MediaItem(
            id: record.id!,
            title: record.title!,
            artist: record.personName!,
            artUri: Uri.parse(record.image!),
          ),
        ),
      );
    } on Exception catch (e) {
      log(e.toString());
    }
    recordDuration = await _player.durationStream.first ?? Duration.zero;
    emit(RecordLoading());

    recordPlay();
  }

  @override
  Future<void> close() async {
    await _stateController?.cancel();

    await _player.dispose();

    return super.close();
  }
}
