import 'package:prayer_time_app/prayer_time_app_library.dart';

class Prayer {
  const Prayer({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  final String? region;
  final String? date;
  final String? weekday;
  final Times? times;

  factory Prayer.fromJson(Map<String, Object?> json) => Prayer(
        region: json["region"] as String?,
        date: json["date"] as String?,
        weekday: json["weekday"] as String?,
        times: Times.fromJson(json["times"] as Map<String, Object?>),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Prayer &&
          runtimeType == other.runtimeType &&
          region == other.region &&
          date == other.date &&
          weekday == other.weekday &&
          times == other.times;

  @override
  int get hashCode =>
      region.hashCode ^ date.hashCode ^ weekday.hashCode ^ times.hashCode;

  @override
  String toString() {
    return 'Prayer('
        'region: $region, '
        'date: $date, '
        'weekday: $weekday, '
        'times: $times)';
  }
}
