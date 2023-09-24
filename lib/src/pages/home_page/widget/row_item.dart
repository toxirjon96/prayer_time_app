import 'package:prayer_time_app/prayer_time_app_library.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    required this.imagePath,
    required this.prayerName,
    required this.prayerTime,
    super.key,
  });

  final String imagePath;
  final String prayerName;
  final String prayerTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                prayerName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.7),
                ),
              ),
            ],
          ),
          Text(
            prayerTime,
            style: TextStyle(
              fontSize: 18,
              color:
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
