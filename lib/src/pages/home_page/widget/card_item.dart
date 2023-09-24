import 'package:prayer_time_app/prayer_time_app_library.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required this.weekName,
    required this.date,
    required this.index,
    required this.selectedIndex,
    required this.onExpanded,
    this.times,
    super.key,
  });

  final String weekName;
  final String date;
  final int index;
  final Times? times;
  final int selectedIndex;
  final Function(int index) onExpanded;

  @override
  Widget build(BuildContext context) {
    bool isOpen = selectedIndex == index;
    Color? activeColor =
        isOpen ? Theme.of(context).colorScheme.onPrimaryContainer : null;

    final ExpansionTileController controller = ExpansionTileController();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        key: Key(index.toString()),
        controller: controller,
        initiallyExpanded: isOpen,
        backgroundColor: activeColor,
        collapsedBackgroundColor: activeColor,
        onExpansionChanged: (value) {
          if (value) {
            onExpanded(index);
          } else {
            onExpanded(-1);
          }
        },
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
              children: times == null
                  ? []
                  : [
                      RowItem(
                        imagePath: "assets/images/bomdod.png",
                        prayerName: "Bomdod",
                        prayerTime: times?.tong_saharlik ?? "",
                      ),
                      RowItem(
                        imagePath: "assets/images/peshin.png",
                        prayerName: "Quyosh",
                        prayerTime: times?.quyosh ?? "",
                      ),
                      RowItem(
                        imagePath: "assets/images/peshin.png",
                        prayerName: "Peshin",
                        prayerTime: times?.peshin ?? "",
                      ),
                      RowItem(
                        imagePath: "assets/images/asr.png",
                        prayerName: "Asr",
                        prayerTime: times?.asr ?? "",
                      ),
                      RowItem(
                        imagePath: "assets/images/shom.png",
                        prayerName: "Shom",
                        prayerTime: times?.shom_iftor ?? "",
                      ),
                      RowItem(
                        imagePath: "assets/images/hufton.png",
                        prayerName: "Hufton",
                        prayerTime: times?.hufton ?? "",
                      ),
                    ],
            ),
          )
        ],
      ),
    );
  }
}
