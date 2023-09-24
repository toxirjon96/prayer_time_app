import 'package:prayer_time_app/prayer_time_app_library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MainController controller;
  int selectedTileIndex = -1;
  bool isFinished = false;

  @override
  void initState() {
    controller = MainController(
      prayerRepository: PrayerRepository(),
    );
    makeRequest("Toshkent");
    super.initState();
  }

  void makeRequest(String region) {
    controller.getPrayerList(region).then((value) {
      setState(() {
        isFinished = true;
      });
    });
  }

  void changeSelected(int index) {
    setState(() {
      selectedTileIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      if (controller.prayerList != null) {
        return ListView.builder(
            key: Key(selectedTileIndex.toString()),
            itemCount: 7,
            itemBuilder: (ctx, index) {
              return CardItem(
                weekName: controller.prayerList?[index].weekday ?? "",
                date: (controller.prayerList?[index].date ?? "").formattedDate,
                index: index,
                times: controller.prayerList?[index].times,
                selectedIndex: selectedTileIndex,
                onExpanded: changeSelected,
              );
            });
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
  }
}
