import 'package:intl/intl.dart';

extension PrayerDateTimeExtension on String {
  String get formattedDate {
    String? date = split(",").firstOrNull;
    DateFormat format = DateFormat('dd/MM/yyyy');
    DateFormat formatTwo = DateFormat('dd.MM.yyyy');

    return date == null ? "" : formatTwo.format(format.parse(date.trim()));
  }

  bool get isEqualToNow {
    String? date = split(",").firstOrNull;
    DateFormat format = DateFormat('dd/MM/yyyy');
    return date == null ? false : _isEqual(format.parse(this), DateTime.now());
  }

  bool _isEqual(DateTime t1, DateTime t2) => t1.day == t2.day && t1.month == t2.month && t1.year == t2.year;
}
