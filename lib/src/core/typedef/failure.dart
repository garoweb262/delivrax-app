import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final DioException error;

  Failure(this.error);
}

class FirebaseFailure {
  final String error;

  FirebaseFailure(this.error);
}

// String mapError(Object error) {
//   if (error is FirebaseAuthException) {
//     return error.message ?? 'An unknown error occurred';
//   } else if (error is FirebaseException) {
//     return error.message ?? 'An unknown error occurred';
//   } else {
//     log(error.toString(), name: 'Other Error');
//     return error.toString();
//   }
// }
