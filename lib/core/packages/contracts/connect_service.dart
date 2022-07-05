abstract class ConnectService {
  Future<HttpResponse> get(String url, {Map<String, String> headers});

  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body, Map<String, String> headers});

  Future<HttpResponse> put(String url,
      {required Map<String, dynamic> body, Map<String, String> headers});

  Future<HttpResponse> delete(String url,
      {required Map<String, dynamic> body, Map<String, String> headers});

  Future<HttpResponse> patch(String url,
      {required dynamic body, Map<String, String> headers});

  Future<ConnectService> getInstance();
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, this.statusCode});
}
