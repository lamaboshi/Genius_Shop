import 'package:dio/dio.dart';
import 'package:genius_shop/main.dart';

class DioApiHandler {
  /// Wraps API calls with standardized error handling and logging
  static Future<T> execute<T>({
    required Future<T> Function() apiCall,
    String? operationName,
    bool logResponse = false,
  }) async {
    try {
      final startTime = DateTime.now();
      if (operationName != null) {
        logger.i('🚀 Starting API operation: $operationName');
      }

      final response = await apiCall();

      if (logResponse) {
        final duration = DateTime.now().difference(startTime);
        logger.f('✅ Success (${duration.inMilliseconds}ms) - $operationName');
        _logResponse(response);
      }

      return response;
    } on DioException catch (e) {
      _logDioError(e, operationName);
      throw _handleDioError(e);
    } catch (e) {
      logger.e('❌ Unexpected error during $operationName: $e');
      throw ApiException.unexpectedError(e.toString());
    }
  }

  static void _logResponse(dynamic response) {
    if (response is Response) {
      logger.i('📊 Response status: ${response.statusCode}');
      logger.i('📦 Response data: ${response.data}');
    }
  }

  static void _logDioError(DioException e, String? operationName) {
    logger.e('''
❌ API Error in ${operationName ?? 'operation'}:
├─ Type: ${e.type}
├─ Message: ${e.message}
├─ URL: ${e.requestOptions.uri}
└─ Response: ${e.response?.data}
''');
  }

  static Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException.timeoutError();
      case DioExceptionType.badResponse:
        return _handleResponseError(e.response!);
      case DioExceptionType.cancel:
        return ApiException.cancelled();
      default:
        return ApiException.networkError(e.message ?? 'Unknown network error');
    }
  }

  static Exception _handleResponseError(Response response) {
    final statusCode = response.statusCode;
    final errorData = response.data;

    if (statusCode == 401) {
      return ApiException.unauthorized();
    } else if (statusCode == 403) {
      return ApiException.forbidden();
    } else if (statusCode == 404) {
      return ApiException.notFound();
    } else if (statusCode == 500) {
      return ApiException.serverError();
    } else if (statusCode == 503) {
      return ApiException.serviceUnavailable();
    } else {
      return ApiException.serverError(
        message: errorData is Map ? errorData['message'] : null,
        code: statusCode,
      );
    }
  }
}

class ApiException implements Exception {
  final String message;
  final int? code;

  ApiException(this.message, {this.code});

  factory ApiException.networkError([String? message]) =>
      ApiException(message ?? 'Network connection failed');

  factory ApiException.timeoutError() => ApiException('Request timed out');

  factory ApiException.unauthorized() =>
      ApiException('Authentication required', code: 401);

  factory ApiException.forbidden() => ApiException('Access denied', code: 403);

  factory ApiException.notFound() =>
      ApiException('Resource not found', code: 404);

  factory ApiException.serverError({String? message, int? code}) =>
      ApiException(message ?? 'Server error occurred', code: code ?? 500);

  factory ApiException.serviceUnavailable() =>
      ApiException('Service unavailable', code: 503);

  factory ApiException.cancelled() => ApiException('Request cancelled');

  factory ApiException.unexpectedError(String message) =>
      ApiException('Unexpected error: $message');

  @override
  String toString() => code != null ? '$code: $message' : message;
}
