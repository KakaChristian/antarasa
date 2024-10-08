import 'package:antarasa/app/common/widgets/snackbar/basic_app_snackbar.dart';
import 'package:antarasa/app/core/routes/app_pages.dart';
import 'package:antarasa/app/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login() async {
    if (emailController.text.trim().isEmpty &&
        passwordController.text.trim().isEmpty) {
      BasicAppSnackbar().show(
        SnackbarType.warning,
        message: 'Email dan Password Wajib Diisi',
      );
      return;
    }

    if (emailController.text.trim().isEmpty) {
      BasicAppSnackbar().show(
        SnackbarType.warning,
        message: 'Email Wajib Diisi',
      );
      return;
    }

    if (passwordController.text.trim().isEmpty) {
      BasicAppSnackbar().show(
        SnackbarType.warning,
        message: 'Password Wajib Diisi',
      );
      return;
    }

    try {
      final response = await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final session = response.session;
      final user = response.user;

      if (user != null && session != null) {
        Get.offNamed(Routes.NAVIGATION);
      } else {
        BasicAppSnackbar()
            .show(SnackbarType.error, message: 'Email Atau Password Salah');
      }
    } catch (_) {
      BasicAppSnackbar()
          .show(SnackbarType.error, message: 'Email Atau Password Salah');
    }
  }
}
