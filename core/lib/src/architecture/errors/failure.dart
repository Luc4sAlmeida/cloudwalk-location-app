abstract class Failure {
  Failure({
    required this.message,
  });

  final String message;
}

class RemoteFailure extends Failure {
  RemoteFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}
