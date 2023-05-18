import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

class LocationGPSDatasource implements LocationDatasource {
  final Geotracker geotracker;

  LocationGPSDatasource({
    required this.geotracker,
  });

  @override
  Future<PositionEntity> getCurrentPosition() async {
    try {
      return geotracker.getCurrentPosition();
    } on Exception {
      throw CacheException(
        message: 'Não foi possível carregar sua localização atual pelo GPS.',
      );
    }
  }
}
