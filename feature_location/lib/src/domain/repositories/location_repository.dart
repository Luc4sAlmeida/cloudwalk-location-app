import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

abstract class LocationRepository {
  Future<Either<Failure, PositionEntity>> getCurrentPosition();
}
