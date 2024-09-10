import 'package:antarasa/app/common/widgets/snackbar/basic_app_snackbar.dart';
import 'package:antarasa/app/core/routes/app_pages.dart';
import 'package:antarasa/app/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  var isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> signup() async {
    if (fullNameController.text.trim().isEmpty &&
        emailController.text.trim().isEmpty &&
        passwordController.text.trim().isEmpty) {
      BasicAppSnackbar()
          .show(SnackbarType.warning, message: 'Nama, Alamat Email dan Password Wajib Diisi');
      return;
    }

    if (fullNameController.text.trim().isEmpty) {
      BasicAppSnackbar()
          .show(SnackbarType.warning, message: 'Nama Wajib Diisi');
      return;
    }

    if (emailController.text.trim().isEmpty) {
      BasicAppSnackbar()
          .show(SnackbarType.warning, message: 'Alamat Email Wajib Diisi');
      return;
    }

    if (passwordController.text.trim().isEmpty) {
      BasicAppSnackbar()
          .show(SnackbarType.warning, message: 'Password Wajib Diisi');
      return;
    } else if (fullNameController.text.trim().length != 6) {
      BasicAppSnackbar().show(SnackbarType.warning,
          message: 'Password Wajib Terdiri dari 6 Karakter');
      return;
    }

    try {
      final response = await supabase.auth.signUp(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
        data: {'fullname': fullNameController.text.trim()},
      );

      final user = response.user;
      final session = response.session;

      if (user != null && session != null) {
        Get.offNamed(Routes.NAVIGATION);
      } else {
        BasicAppSnackbar()
            .show(SnackbarType.error, message: 'Gagal Membuat Akun');
      }
    } on AuthException catch (_) {
      BasicAppSnackbar()
          .show(SnackbarType.error, message: 'Gagal Membuat Akun');
    }
  }
}
