import 'package:bloc/constants/api_constatnts.dart';
import 'package:bloc/network/dio_interceptor.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    // Create Dio instance with base URL and any default configurations
    _dio = Dio(BaseOptions(baseUrl: APIConstants.baseUrl));

    // Add the custom interceptor
    _dio.interceptors.add(MyInterceptor());
  }

  // Method for making GET requests
  Future<Response> get(String path, {required Map<String, dynamic> queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  // Method for making POST requests
  Future<Response> post(String path, {required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  // Add more methods for other HTTP request types as needed

  // For example, a method for making PUT requests
  Future<Response> put(String path, {required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
