import 'package:asuka/asuka.dart' as asuka;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/custom_widet/alert_dialog.dart';

class Notifications {
  static bool isOverlay = false;
  static success(String? message) => showSnackBar(
        content: message?.tr(),
        backgroundColor: Colors.green,
      );

  static error(String? message) => showSnackBar(
        content: message?.tr(),
        backgroundColor: Colors.red,
      );

  static showLoading() {
    isOverlay = true;
    asuka.addOverlay(loadingOverLay);
  }

  static hideLoading() {
    if (isOverlay) {
      loadingOverLay.remove();
      isOverlay = false;
    }
  }

  static OverlayEntry loadingOverLay = OverlayEntry(
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.black.withOpacity(.8),
          child: const Center(
            child: CircularProgressIndicator(),
            // child: Image.asset(AssetsHelpers.loading),
          ),
        ),
      );
    },
  );
  static showSnackBar(
      {String? content, Color? textColor, Color? backgroundColor}) {
    asuka.showSnackBar(SnackBar(
      content: Text(
        content ?? '',
        style: GoogleFonts.cairo(
          color: textColor ?? Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.black26,
      duration: Duration(seconds: 1),
    ));
  }

  static confirmDialog(BuildContext context,
      {String? title,
      String? content,
      String? cancelText,
      String? confirmText,
      VoidCallback? onConfirm,
      VoidCallback? onCancel,
      bool dismissible = true}) {
    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      useRootNavigator: false,
      builder: (_) => alertDialog(
        context: context,
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  static dialog(BuildContext context,
          {Widget? child, bool dismissible = true}) =>
      showDialog(
          context: context,
          barrierDismissible: dismissible,
          useRootNavigator: false,
          builder: (_) => child!);
}
