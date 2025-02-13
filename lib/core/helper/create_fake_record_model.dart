import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';
import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';

RecordModel createFakeRecordModel() {
  return RecordModel(
    id: "",
    type: "",
    image: "",
    recordUrl: "",
    title: "fake date for loading",
    personName: "fake data",
    duration: TimeDuration(hour: 1, minute: 22, second: 20),
  );
}
