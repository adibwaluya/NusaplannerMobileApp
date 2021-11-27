import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
Dio dio() {
  Dio dio = new Dio();

  // Previous ip-address: http://192.168.42.75:8000/api/
  dio.options.baseUrl = 'http://192.168.42.75:8000/api/';

  // dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) async {
    request.headers['Accept'] = 'application/json';
    var token = await storage.read(key: 'token');

    if (token.toString().isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(request);
  }));
  return dio;
}
