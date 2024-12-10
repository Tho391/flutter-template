import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/core/constants/app_constants.dart';

import '../logging/logging.dart'; // Import Talker for logging

class DioClient {
  Dio dio;

  // Constructor to set up Dio with TalkerDioLogger
  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: dotenv.env[AppConstants.baseUrl] ?? "",
            // Get base URL from .env file or fallback
            connectTimeout: Duration(seconds: 30),
            receiveTimeout: Duration(seconds: 30),
          ),
        ) {
    // Add TalkerDioLogger to Dio's interceptors for logging requests and responses
    dio.interceptors.add(Logging.dioLogger);
  }

  // Example GET request using Dio
  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Example POST request using Dio
  Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
