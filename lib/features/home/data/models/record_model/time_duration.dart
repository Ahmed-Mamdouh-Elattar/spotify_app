class TimeDuration {
  final num? hour;
  final num? minute;
  final num? second;

  TimeDuration({
    required this.hour,
    required this.minute,
    required this.second,
  });
  factory TimeDuration.fromJson(json) {
    return TimeDuration(
      hour: json["hour"],
      minute: json["minute"],
      second: json["second"],
    );
  }
}
