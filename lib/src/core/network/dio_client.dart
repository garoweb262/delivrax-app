import '../packages.dart';

class DioClient {
  // dio instance
  final Dio _dio = Dio();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> refreshToken() async {
    try {
      var refreshToken = await storage.read(key: Endpoints.refresh_token);
      print('refresh token called');
      var response = await _dio.post(
        Endpoints.baseUrl + Endpoints.refreshToken,
        data: {"refresh": refreshToken},
      );

      if (response.statusCode == 200) {
        var accessToken = response.data['data']['access_token'];
        await storage.write(key: Endpoints.access_token, value: accessToken);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  DioClient() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout = Duration(milliseconds:Endpoints.receiveTimeout)
      // ..options.connectTimeout = Endpoints.connectionTimeout
      // ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers['content-Type'] = 'application/json'
      ..options.headers['accept'] = '*/*'
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) async {
            if (error.response != null) {
              if (error.response!.statusCode == 401 &&
                  error.response!.data['status'] != null) {
                if (error.response!.data['message'].toString().contains(
                  'expired',
                )) {
                  await refreshToken().then((value) async {
                    if (value) {
                      handler.resolve(await _retry(error.requestOptions));
                    } else {
                      handler.reject(error);
                    }
                    // _retry(error.requestOptions);
                  });
                } else {
                  handler.reject(error);
                }
              } else {
                handler.reject(error);
              }
            } else {
              handler.reject(error);
            }
          },
        ),
      )
      ..options.responseType = ResponseType.json;
  }

  // Get:----------------------------------------------------------------------

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}