import 'package:prayer_time_app/prayer_time_app_library.dart';

class ApiService {
  static ApiService _apiService(Dio dio) => ApiService._internal(dio);

  final Dio _dio;

  factory ApiService(Dio dio) {
    return _apiService(dio);
  }

  ApiService._internal(this._dio);

  Future<String> request(
    String path, {
    Method method = Method.get,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
  }) async {
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    try {
      Response<String>? response = await switch (method) {
        Method.get =>
          _dio.get<String>(path, data: body, queryParameters: queryParameters),
        Method.post =>
          _dio.get<String>(path, data: body, queryParameters: queryParameters),
        Method.put =>
          _dio.get<String>(path, data: body, queryParameters: queryParameters),
        Method.patch =>
          _dio.get<String>(path, data: body, queryParameters: queryParameters),
        Method.delete =>
          _dio.get<String>(path, data: body, queryParameters: queryParameters),
      };

      return switch (response.statusCode) {
        null => Error.throwWithStackTrace(
            UnknownException("${response.data}", -1),
            StackTrace.current,
          ),
        >= 100 && < 200 => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 200 && < 300 => response.data ?? "",
        >= 300 && < 400 => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 400 && < 500 => Error.throwWithStackTrace(
            ClientException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 500 && < 600 => Error.throwWithStackTrace(
            ServerException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        _ => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
      };
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }
}
