import 'package:core/core.dart';
import 'package:http/http.dart' as http;

class IORemoteImpl implements IORemote {
  final _client = http.Client();

  @override
  Future<IOResponse> request(
    Uri url, {
    required IOMethod method,
    Map<String, String>? headers,
  }) {
    switch (method) {
      case IOMethod.get:
        return _get(url, headers);
      case IOMethod.post:
        return _post(url, headers);
      case IOMethod.put:
        return _put(url, headers);
      case IOMethod.delete:
        return _delete(url, headers);
      case IOMethod.patch:
        return _patch(url, headers);
      case IOMethod.head:
        return _head(url, headers);

      default:
        throw UnimplementedError();
    }
  }

  Future<IOResponse> _get(Uri url, Map<String, String>? headers) async {
    return _fromHttpResponse(await _client.get(url, headers: headers));
  }

  Future<IOResponse> _post(Uri url, Map<String, String>? headers) async {
    return _fromHttpResponse(await _client.post(url, headers: headers));
  }

  Future<IOResponse> _put(Uri url, Map<String, String>? headers) async {
    return _fromHttpResponse(await _client.put(url, headers: headers));
  }

  Future<IOResponse> _delete(Uri url, Map<String, String>? headers) async {
    return _fromHttpResponse(await _client.delete(url, headers: headers));
  }

  Future<IOResponse> _patch(Uri url, Map<String, String>? headers) async {
    return _fromHttpResponse(await _client.patch(url, headers: headers));
  }

  Future<IOResponse> _head(Uri url, Map<String, String>? headers) async {
    return _fromHttpResponse(await _client.head(url, headers: headers));
  }

  IOResponse _fromHttpResponse(http.Response response) {
    return IOResponse(body: response.body, status: response.statusCode);
  }
}
