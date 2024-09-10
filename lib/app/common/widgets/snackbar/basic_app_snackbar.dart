import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

enum SnackbarType { success, error, warning, info }

class BasicAppSnackbar {
  void show(SnackbarType type, {required String message}) {
    final context = Get.overlayContext ?? Get.context;

    if (context != null) {
      final overlay = Overlay.of(context);

      switch (type) {
        case SnackbarType.success:
          showTopSnackBar(
            overlay,
            CustomSnackBar.success(
              message: message,
            ),
          );
          break;

        case SnackbarType.error:
          showTopSnackBar(
            overlay,
            CustomSnackBar.error(
              message: message,
            ),
          );
          break;

        case SnackbarType.warning:
          showTopSnackBar(
            overlay,
            CustomSnackBar.info(
              message: message,
              backgroundColor: Colors.orange,
            ),
          );
          break;

        case SnackbarType.info:
          showTopSnackBar(
            overlay,
            CustomSnackBar.info(
              message: message,
            ),
          );
          break;
      }
    }
  }
}
