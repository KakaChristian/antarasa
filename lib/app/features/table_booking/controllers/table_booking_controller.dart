import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableBookingController extends GetxController {
  TextEditingController catatanController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController jMController = TextEditingController();
  TextEditingController jOController = TextEditingController();

  var currentInputLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    jOController.addListener(() {
      _validateInputJO();
    });
    jMController.addListener(() {
      _validateInputJM();
    });
  }

  void _validateInputJO() {
    final jOText = jOController.text;
    if (jOText.isNotEmpty) {
      final val1 = int.tryParse(jOText);

      if (val1 != null && val1 > 20) {
        // Jika input lebih dari 20, reset ke 20
        jOController.text = '20';
        jOController.selection = TextSelection.fromPosition(
          TextPosition(offset: jOController.text.length),
        );
      }
    }
  }

  void _validateInputJM() {
    final jMText = jMController.text;
    if (jMText.isNotEmpty) {
      final val1 = int.tryParse(jMText);

      if (val1 != null && val1 > 20) {
        // Jika input lebih dari 20, reset ke 20
        jMController.text = '20';
        jMController.selection = TextSelection.fromPosition(
          TextPosition(offset: jMController.text.length),
        );
      }
    }
  }

  @override
  void onClose() {
    jOController.dispose();
    jMController.dispose();
    super.onClose();
  }
}
