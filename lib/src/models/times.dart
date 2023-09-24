class Times {
  const Times({
    required this.tong_saharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom_iftor,
    required this.hufton,
  });

  final String? tong_saharlik;
  final String? quyosh;
  final String? peshin;
  final String? asr;
  final String? shom_iftor;
  final String? hufton;

  factory Times.fromJson(Map<String, Object?> json) => Times(
        tong_saharlik: json["tong_saharlik"] as String?,
        quyosh: json["quyosh"] as String?,
        peshin: json["peshin"] as String?,
        asr: json["asr"] as String?,
        shom_iftor: json["shom_iftor"] as String?,
        hufton: json["hufton"] as String?,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Times &&
          runtimeType == other.runtimeType &&
          tong_saharlik == other.tong_saharlik &&
          quyosh == other.quyosh &&
          peshin == other.peshin &&
          asr == other.asr &&
          shom_iftor == other.shom_iftor &&
          hufton == other.hufton;

  @override
  int get hashCode =>
      tong_saharlik.hashCode ^
      quyosh.hashCode ^
      peshin.hashCode ^
      asr.hashCode ^
      shom_iftor.hashCode ^
      hufton.hashCode;


  @override
  String toString() {
    return 'Times('
        'tong_saharlik: $tong_saharlik, '
        'quyosh: $quyosh, '
        'peshin: $peshin, '
        'asr: $asr, '
        'shom_iftor: $shom_iftor, '
        'hufton: $hufton)';
  }
}
