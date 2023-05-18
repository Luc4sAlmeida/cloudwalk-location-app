import 'package:core/core.dart';

import 'package:feature_location/src/src.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl({
    required this.geotracker,
    required this.gps,
    required this.ip,
  });

  final Geotracker geotracker;
  final LocationDatasource gps;
  final LocationDatasource ip;

  @override
  Future<Either<Failure, PositionEntity>> getCurrentPosition() async {
    try {
      final isServiceDisabled = !(await geotracker.isServiceEnabled());

      if (isServiceDisabled) {
        return Right(await ip.getCurrentPosition());
      }

      final isPermissionDenied = !(await geotracker.requestPermission());

      if (isPermissionDenied) {
        return Right(await ip.getCurrentPosition());
      }

      return Right(await gps.getCurrentPosition());
    } on RemoteException catch (ex) {
      return Left(RemoteFailure(message: ex.message));
    } on CacheException catch (ex) {
      return Left(CacheFailure(message: ex.message));
    }
  }
}
