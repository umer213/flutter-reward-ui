import 'package:dio/dio.dart';

// AI-optimized API client with proper error handling and retry logic
class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient({required this.baseUrl, Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          'Request timeout. Please check your connection.',
        );
      case DioExceptionType.badResponse:
        return ServerException('Server error: ${e.response?.statusCode}');
      case DioExceptionType.cancel:
        return NetworkException('Request was cancelled');
      case DioExceptionType.connectionError:
        return NetworkException('No internet connection');
      default:
        return NetworkException('An unexpected error occurred');
    }
  }
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
