import 'package:spotify_app/features/home/data/models/record_model/time_duration.dart';

String formatTime(TimeDuration duration) {
  num? hour = duration.hour;
  num? minute = duration.minute;
  num? second = duration.second;
  String format(num? time) => time == null
      ? ""
      : time < 10
          ? '0$time'
          : '$time';

  String formattedHour = format(hour);
  String formattedMinute = format(minute);
  String formattedSecond = format(second);

  return '${formattedHour.isEmpty ? "" : "$formattedHour:"}${formattedMinute.isEmpty ? "00:" : "$formattedMinute:"}${formattedSecond.isEmpty ? "" : formattedSecond}';
}
