import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';

class RecordModel {
  final String? type;
  final String? image;
  final String? recordUrl;
  final String? title;
  final String? personName;
  TimeDuration duration;

  RecordModel({
    required this.type,
    required this.image,
    required this.recordUrl,
    required this.title,
    required this.personName,
    required this.duration,
  });
  factory RecordModel.fromJson(json) {
    return RecordModel(
      type: json["type"],
      image: json["image"],
      recordUrl: json["record_url"],
      title: json["title"],
      personName: json["person_name"],
      duration: TimeDuration.fromJson(
        json["duration"],
      ),
    );
  }
}
