import 'http_client_service_interface.dart';

class HttpClientMock implements IHttpService {
  @override
  Future<dynamic> get(Object path,
      {Map<String, dynamic>? queryParameters}) async {
    return [];
  }

  @override
  Future<void> post(String path,
      {Map<String, dynamic>? queryParameters}) async {}
}
