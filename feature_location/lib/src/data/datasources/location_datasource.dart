import 'package:feature_location/src/src.dart';

abstract class LocationDatasource {
  Future<PositionEntity> getCurrentPosition();
}
