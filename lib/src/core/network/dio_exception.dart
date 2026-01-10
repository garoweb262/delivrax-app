import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = 'Unknown Error Occurred';

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;

      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;

      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;

      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;

      case DioExceptionType.connectionError:
        if (dioError.error != null &&
            dioError.error.toString().contains("SocketException")) {
          message = 'No Internet Connection / Connection Failure';
        } else {
          message = "Unexpected error occurred ${dioError.error ?? ''}";
        }
        break;

      case DioExceptionType.badResponse:
        final response = dioError.response;
        final statusCode = response?.statusCode;
        final data = response?.data;

        // Check if response contains HTML error page
        if (data != null &&
            data.toString().contains('<!DOCTYPE html>') &&
            !(dioError.error?.toString().contains("SocketException") ??
                false)) {
          message = 'Error occurred, Try again';
        } else {
          // Handle HTTP status codes
          message = _handleError(statusCode, data);
        }
        break;

      case DioExceptionType.unknown:
        if (dioError.error != null &&
            dioError.error.toString().contains("SocketException")) {
          message = 'No Internet Connection';
        } else {
          message = "Unknown error occurred: ${dioError.error ?? ''}";
        }
        break;

      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 200:
      case 201:
        // Success responses - extract message if available
        if (error is Map && error.containsKey('message')) {
          return error['message']?.toString() ?? 'Request succeeded';
        }
        return 'Request succeeded';

      case 400:
        if (error is Map) {
          return error['message']?.toString() ?? 'Bad request';
        }
        return 'Bad request';

      case 401:
        if (error is Map) {
          return error['message']?.toString() ?? 'Unauthorized';
        }
        return 'Unauthorized';

      case 403:
        if (error is Map) {
          return error['message']?.toString() ?? 'Forbidden';
        }
        return 'Forbidden';

      case 404:
        if (error is Map) {
          return error['message']?.toString() ?? 'Resource not found';
        }
        return 'Resource not found';

      case 422:
        if (error is Map) {
          return error['message']?.toString() ?? 'Validation failed';
        }
        return 'Validation failed';

      case 500:
        return 'Internal server error';

      case 502:
        return 'Bad gateway';

      case 503:
        return 'Service unavailable';

      case 504:
        return 'Gateway timeout';

      default:
        if (error is Map) {
          // Try to extract error message in order of preference
          if (error.containsKey('message') && error['message'] != null) {
            return error['message'].toString();
          }
          if (error.containsKey('error') && error['error'] != null) {
            return error['error'].toString();
          }
          if (error.containsKey('errors') && error['errors'] != null) {
            final errors = error['errors'];
            if (errors is List && errors.isNotEmpty) {
              return errors.first.toString();
            }
            return errors.toString();
          }
        }
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
