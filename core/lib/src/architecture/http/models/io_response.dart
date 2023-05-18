enum IOMethod {
  post,
  get,
  put,
  delete,
  patch,
  head,
}

class IOResponse {
  final String body;
  final int status;

  IOResponse({
    required this.body,
    required this.status,
  });
}
