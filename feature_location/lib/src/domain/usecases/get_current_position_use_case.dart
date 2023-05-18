import 'package:core/core.dart';
import 'package:feature_location/src/domain/domain.dart';

class GetCurrentPositionUseCase implements UseCase<NoParams, PositionEntity> {
  GetCurrentPositionUseCase({
    required this.repository,
  });

  final LocationRepository repository;

  @override
  Future<Either<Failure, PositionEntity>> call({required NoParams params}) {
    return repository.getCurrentPosition();
  }
}
