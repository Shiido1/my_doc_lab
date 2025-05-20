import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';

class AppUtils {
  static Future<void> snackbar(
    BuildContext? context, {
    required String? message,
    bool error = false,
  }) {
    return Flushbar(
      title: error ? 'Oopss!' : 'Great!',
      titleColor: Colors.white,
      message:
          message == 'Null check operator used on a null value'
              ? 'Connection to server failed due to internet connection, please check and try again'
              : message,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: error ? AppColor.red : AppColor.primary1,
    ).show(context!);
  }

  static Future<void> snackbarTop(
    BuildContext? context, {
    required String? message,
    bool error = false,
  }) {
    return Flushbar(
      title: error ? 'Oopss!' : 'Great!',
      titleColor: Colors.white,
      message:
          message == 'Null check operator used on a null value'
              ? 'Connection to server failed due to internet connection, please check and try again'
              : message,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: error ? AppColor.red : AppColor.primary1,
    ).show(context!);
  }
}
