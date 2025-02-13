import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';

class RecordModel {
  final String? id;
  final String? type;
  final String? image;
  final String? recordUrl;
  final String? title;
  final String? personName;
  final TimeDuration duration;

  RecordModel({
    required this.id,
    required this.type,
    required this.image,
    required this.recordUrl,
    required this.title,
    required this.personName,
    required this.duration,
  });
  factory RecordModel.fromJson(
      {required Map<String, dynamic> json, required String? id}) {
    return RecordModel(
      id: id,
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
