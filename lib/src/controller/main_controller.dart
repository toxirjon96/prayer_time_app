import 'package:prayer_time_app/prayer_time_app_library.dart';

class MainController {
  MainController({
    required IPrayerRepository prayerRepository,
  }) : _prayerRepository = prayerRepository;

  final IPrayerRepository _prayerRepository;

  List<Prayer>? prayerList;
  String? _errorMessage;

  String get errorMessage => _errorMessage!;

  bool get isProgress => prayerList == null;

  Future<void> getPrayerList(String region) async {
    try {
      prayerList = await _prayerRepository.getPrayerList(region);
    } on UnknownException catch (error, stackTrace) {
      _errorMessage = "There something wrong!";
    } on ClientException catch (error, stackTrace) {
      _errorMessage = "Check your internet connection!";
    } on ServerException catch (error, stackTrace) {
      _errorMessage = "Internal server error";
    } on Object catch (error, stackTrace) {
      _errorMessage = "There something wrong!";
    }
  }
}
