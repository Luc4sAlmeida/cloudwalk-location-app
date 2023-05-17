class RemoteException implements Exception {
  RemoteException({
    required this.message,
  });
  final String message;
}

class CacheException implements Exception {
  CacheException({
    required this.message,
  });
  final String message;
}
