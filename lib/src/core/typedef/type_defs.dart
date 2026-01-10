import 'package:fpdart/fpdart.dart';
import 'failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
// typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;

// Firebase specific typedefs
typedef FutureEitherFirebase<T> = Future<Either<FirebaseFailure, T>>;
typedef FutureVoidFirebase = FutureEitherFirebase<void>;








class AsyncState<T> {
  final bool isLoading;
  final T? data;
  final String? error;
  const AsyncState({this.isLoading = false, this.data, this.error});
  factory AsyncState.loading() => AsyncState(isLoading: true);
  factory AsyncState.data(T data) => AsyncState(data: data);
  factory AsyncState.error(String error) => AsyncState(error: error);
}