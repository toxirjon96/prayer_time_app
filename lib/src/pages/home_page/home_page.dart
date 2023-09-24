import 'package:prayer_time_app/prayer_time_app_library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MainController controller;

  @override
  void initState() {
    controller = MainController(
      prayerRepository: PrayerRepository(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getPrayerList("Toshkent"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (controller.prayerList != null) {
            return ListView(
              children: controller.prayerList!.map<Widget>((prayer) {
                return CardItem(
                  weekName: prayer.weekday ?? "",
                  date: (prayer.date ?? "").formattedDate,
                  times: prayer.times,
                  isOpen: (prayer.date ?? "").isEqualToNow,
                );
              }).toList(),
            );
          } else {
            return Center(
              child: Text(controller.errorMessage),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          );
        }
      },
    );
  }
}
