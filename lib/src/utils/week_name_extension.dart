extension WeekNameExtension on String {
  String get prayerName => switch (this) {
        "tong_saharlik" => "Bomdod",
        "quyosh" => "Quyosh",
        "peshin" => "Peshin",
        "asr" => "Asr",
        "shom_iftor" => "Shom",
        "hufton" => "Hufton",
        _ => "",
      };
}
