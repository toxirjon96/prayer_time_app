import 'package:prayer_time_app/prayer_time_app_library.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required this.weekName,
    required this.date,
    this.isOpen = false,
    this.times,
    super.key,
  });

  final String weekName;
  final String date;
  final bool isOpen;
  final Times? times;

  @override
  Widget build(BuildContext context) {
    Color? activeColor =
        isOpen ? Theme.of(context).colorScheme.onPrimaryContainer : null;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        initiallyExpanded: isOpen,
        backgroundColor:activeColor,
        collapsedBackgroundColor: activeColor,
        title: Text(
          weekName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: times == null? [] :
              [
                RowItem(
                  imagePath: "assets/images/bomdod.png",
                  prayerName: "Bomdod",
                  prayerTime: times?.tong_saharlik??"",
                ),
                RowItem(
                  imagePath: "assets/images/peshin.png",
                  prayerName: "Quyosh",
                  prayerTime: times?.quyosh??"",
                ),
                RowItem(
                  imagePath: "assets/images/peshin.png",
                  prayerName: "Peshin",
                  prayerTime: times?.peshin??"",
                ),
                RowItem(
                  imagePath: "assets/images/asr.png",
                  prayerName: "Asr",
                  prayerTime: times?.asr??"",
                ),
                RowItem(
                  imagePath: "assets/images/shom.png",
                  prayerName: "Shom",
                  prayerTime: times?.shom_iftor??"",
                ),
                RowItem(
                  imagePath: "assets/images/hufton.png",
                  prayerName: "Hufton",
                  prayerTime: times?.hufton??"",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
