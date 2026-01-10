import 'dart:developer';

import '../packages.dart';

// typedef FutureEither<T> = Future<Either<Failure, T>>;

/// A utility class for handling requests, loading states, and errors
class RequestHandler {
  static Future<void> handleRequest<T>(
    StateNotifier<bool> stateController,
    FutureEither<T> Function() request, {
    required Function(T) onSuccess,
    VoidCallback? onError,
  }) async {
    try {
      stateController.state = true; // Set loading state to true
      final result = await request();
      result.fold(
        (failure) {
          stateController.state = false;
          AppConfig.handleErrorMessage(failure.error);
          if (onError != null) onError();
        },
        (data) {
          onSuccess(data);
          stateController.state = false;
        },
      );
    } catch (e) {
      stateController.state = false;
      log('${e}log errors');
      AppConfig.showToast(e.toString(), AppColors.redLight);
      if (onError != null) onError();
    }
  }
}
