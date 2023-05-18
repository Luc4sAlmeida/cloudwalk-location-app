import 'package:core/core.dart';

abstract class IORemote {
  Future<IOResponse> request(
    Uri url, {
    required IOMethod method,
    Map<String, String>? headers,
  });
}
