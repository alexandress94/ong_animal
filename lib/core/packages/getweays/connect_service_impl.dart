import 'package:get/get.dart';
import 'package:ong_animals/core/packages/contracts/connect_service.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:ong_animals/core/packages/getweays/log_service_impl.dart';

class ConnectServiceImpl implements ConnectService {
  final _getConnect = GetConnect();
  final LogService _log = LogServiceImpl();

  @override
  Future<ConnectServiceImpl> getInstance() async {
    return this;
  }

  @override
  Future<HttpResponse> delete(String url,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _getConnect.delete(
      url,
      headers: headers,
    );
    _logs(
        method: 'DELETE',
        url: url,
        body: body,
        response: response,
        headers: headers,
        statusCode: response.statusCode.toString());
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await _getConnect.get(url, headers: headers);
    _logs(
        method: 'GET',
        url: url,
        headers: headers,
        response: response,
        body: '',
        statusCode: response.statusCode.toString());
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> patch(String url,
      {required body, Map<String, String>? headers}) async {
    final response = await _getConnect.patch(url, body, headers: headers);
    _logs(
        method: 'PATCH',
        url: url,
        body: body,
        headers: headers,
        response: response,
        statusCode: response.statusCode.toString());
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _getConnect.post(url, body, headers: headers);
    _logs(
        headers: headers,
        body: body,
        url: url,
        method: 'POST',
        response: response,
        statusCode: response.statusCode.toString());
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> put(String url,
      {required dynamic body, Map<String, String>? headers}) async {
    final response = await _getConnect.put(url, body, headers: headers);
    _logs(
        method: 'PUT',
        url: url,
        body: body,
        headers: headers,
        response: response,
        statusCode: response.statusCode.toString());
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  void _logs(
      {required String url,
      body,
      required Map<String, String>? headers,
      required Response<dynamic> response,
      required String method,
      required String statusCode}) {
    _log.append('############### $method ###############');
    _log.append('URL: $url');
    _log.append('StatusCode: $statusCode');
    _log.append('BODY: $body');
    _log.append('HEADERS: $headers');
    _log.append('RESPONSE: ${response.body}');
    _log.append('######################################');
    _log.closeAppend();
  }
}
