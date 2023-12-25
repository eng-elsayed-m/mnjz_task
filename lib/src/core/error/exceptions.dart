class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class OfflineException implements Exception {
  OfflineException();
}
