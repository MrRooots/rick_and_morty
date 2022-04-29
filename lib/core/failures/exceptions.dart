class ServerException implements Exception {
  final String errorMessage;

  ServerException({required final this.errorMessage});
}

class CacheException implements Exception {
  final String errorMessage;

  CacheException({required final this.errorMessage});
}
