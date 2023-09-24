class ServerException implements Exception {
  final String _message;
  final int _statusCode;

  const ServerException(
    String message,
    int statusCode,
  )   : _message = message,
        _statusCode = statusCode;

  String get message => _message;

  int get statusCode => _statusCode;
}
