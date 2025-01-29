class ServerException implements Exception {
  final String errorMessage;
  final int statusCode;

  ServerException({
    required this.errorMessage,
    required this.statusCode,
  });
}
