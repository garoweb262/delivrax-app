import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';

import '../network/dio_exception.dart';
import '../packages.dart';

class AppConfig {
  static const minTextScaleFactor = 1.0;
  static const maxTextScaleFactor = 1.06;

  static const String privacyPolicyText = "";

  static handleErrorMessage(DioException dioError, [Function? bttnfn]) {
    final errorMessage =
        DioExceptions.fromDioError(dioError).toString().toTitleCase();
    log(dioError.toString());
    if (kDebugMode) log(dioError.requestOptions.path);
    if (kDebugMode) log('${dioError.response?.data} $dioError');
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColors.redLight,
      flushbarStyle: FlushbarStyle.GROUNDED,
      title: 'Error',
      message: errorMessage,
      duration: Duration(seconds: 3),
    ).show(NavigatorKey.myKey.currentContext!);
    return errorMessage;
  }

  static showToast(
    String message, [
    Color? color,
    Function? bttnfn,
    Widget? child,
  ]) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color ?? AppColors.green,
      duration: Duration(seconds: 3),
      title: 'Message',
      message: message,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(NavigatorKey.myKey.currentContext!);
  }

  static showErrorToast(
    String message, [
    Color? color,
    Function? bttnfn,
    Widget? child,
  ]) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color ?? AppColors.redLight,
      duration: Duration(seconds: 3),
      title: 'Message',
      message: message,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(NavigatorKey.myKey.currentContext!);
  }

  static copyToClip({required String data, required String message}) async {
    await Clipboard.setData(ClipboardData(text: data));
    showToast('$message copied to clipboard');
  }

  static showAlert(
    BuildContext context,
    String message, [
    Color? color,
    Function? bttnfn,
  ]) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // contentTextStyle: ,
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.transparent,
          title: Center(
            child: Text(
              'Alert!',
              style: AppTextStyle.headline1.copyWith(
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyText1,
          ),
          actions: [
            LoadingButton(
              onPressed: () {
                if (bttnfn != null) {
                  bttnfn();
                  pop(context);
                }
                pop(context);
              },
              isLoading: false,
              child: Text('Okay', style: AppTextStyle.pryBtnStyle),
            ),
          ],
        );
      },
    );
  }
}
