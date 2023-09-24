import 'package:prayer_time_app/prayer_time_app_library.dart';

abstract interface class IPrayerRepository {
  abstract final PrayerServiceWrapper wrapper;

  Future<List<Prayer>> getPrayerList(String region);
}

class PrayerRepository implements IPrayerRepository {
  PrayerRepository() : wrapper = PrayerServiceWrapper(_dio);

  static final _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json,
  ));

  @override
  final PrayerServiceWrapper wrapper;

  @override
  Future<List<Prayer>> getPrayerList(String region) async {
    String response = await wrapper.request(
      ApiConstants.path,
      queryParameters: ApiConstants.queryParams(region),
    );

    return _prayerList(jsonDecode(response));
  }

  List<Prayer> _prayerList(List<Object?> jsonList) {
    return jsonList
        .map((json) => Prayer.fromJson(json as Map<String, Object?>))
        .toList();
  }
}
