class UnknownException implements Exception {
  final String _message;
  final int _statusCode;

  const UnknownException(
    String message,
    int statusCode,
  )   : _message = message,
        _statusCode = statusCode;

  String get message => _message;

  int get statusCode => _statusCode;
}
