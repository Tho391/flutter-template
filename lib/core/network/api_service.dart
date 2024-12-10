import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  // Example GET request
  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Example POST request
  Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}