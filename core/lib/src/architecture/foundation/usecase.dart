import 'package:core/core.dart';

abstract class UseCase<Params, Output> {
  Future<Either<Failure, Output>> call({required Params params});
}

abstract class Params {}

class NoParams implements Params {}
