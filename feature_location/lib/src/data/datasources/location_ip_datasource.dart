import 'dart:convert';

import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

class LocationIPDatasource implements LocationDatasource {
  LocationIPDatasource({
    required this.client,
    required this.mapper,
  });

  final IORemote client;
  final LocationIPMapper mapper;

  final url = 'https://my-ip.theboringdude.workers.dev/';

  @override
  Future<PositionEntity> getCurrentPosition() async {
    try {
      final response = await client.request(
        Uri.parse(url),
        method: IOMethod.get,
      );

      if (response.status != 200) {
        throw RemoteException(
          message:
              'Não foi possível solicitar informações sobre sua localização.',
        );
      }
      return mapper.fromMap(jsonDecode(response.body));
    } on RemoteException {
      rethrow;
    } on Exception {
      throw RemoteException(
        message: 'Não foi possível se conectar com a Internet.',
      );
    }
  }
}
