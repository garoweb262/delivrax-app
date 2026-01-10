import 'package:fpdart/fpdart.dart';

import '../packages.dart';

final apiProvider = Provider<ApiRequest>((ref) {
  return ApiRequest();
});

class ApiRequest {
  final DioClient _dioClient = DioClient();
  Future<Map<String, String>> requestHeader() async {
    final accessToken = await LocalStorage().get(Endpoints.access_token);
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  FutureEither<T> postRequest<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final res = await _dioClient.post(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return right(fromJson(res.data));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<T> putRequest<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final res = await _dioClient.put(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return right(fromJson(res.data));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<T> patchRequest<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final res = await _dioClient.patch(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return right(fromJson(res.data));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<T> getRequest<T>({
    required String endpoint,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final res = await _dioClient.get(
        endpoint,
        options: Options(headers: headers),
      );
      return right(fromJson(res.data));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither deleteRequest<T>({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await _dioClient.delete(
        endpoint,
        options: Options(headers: headers),
      );
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  // // Void Either Call

  // FutureVoid postVoidRequest({
  //   required String endpoint,
  //   Map<String, dynamic>? data,
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     final res = await _dioClient.post(
  //       endpoint,
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     return right(res);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  // FutureVoid putVoidRequest({
  //   required String endpoint,
  //   Map<String, dynamic>? data,
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     final res = await _dioClient.put(
  //       endpoint,
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     return right(res);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  // FutureVoid patchVoidRequest({
  //   required String endpoint,
  //   Map<String, dynamic>? data,
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     final res = await _dioClient.patch(
  //       endpoint,
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     return right(res);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  // FutureVoid getVoidRequest({
  //   required String endpoint,
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     final res = await _dioClient.get(
  //       endpoint,
  //       options: Options(headers: headers),
  //     );
  //     return right(res);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }
}
