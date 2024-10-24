import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/snackbar/basic_app_snackbar.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/constant/constant.dart';

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
      BasicAppSnackbar().show(SnackbarType.warning,
          message: 'Nama, Alamat Email dan Password Wajib Diisi');
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
    } else if (passwordController.text.trim().length < 6) {
      BasicAppSnackbar().show(SnackbarType.warning,
          message: 'Password Wajib Terdiri dari 6 Karakter');
      return;
    }

    try {
      final response = await supabase.auth.signUp(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
        data: {'full_name': fullNameController.text.trim()},
      );

      final user = response.user;
      final session = response.session;

      String extractFirstName(String fullName) {
        final nameParts = fullName.split(' ');
        return nameParts.isNotEmpty ? nameParts.first : '';
      }

      if (user != null && session != null) {
        await supabase.from('users').insert({
          'user_id': user.id,
          'email': emailController.text.trim(),
          'full_name': fullNameController.text.trim(),
          'user_name': extractFirstName(fullNameController.text.trim()),
        });

        final accessToken = session.accessToken;
        final refreshToken = session.refreshToken;

        final sessionMap = {
          "accessToken": accessToken,
          "refreshToken": refreshToken,
        };

        await Constants.getBox.write("supabaseSession", sessionMap);

        BasicAppSnackbar()
            .show(SnackbarType.success, message: 'Berhasil Membuat Akun');
        Get.offNamed(Routes.NAVIGATION);
      } else {
        BasicAppSnackbar()
            .show(SnackbarType.error, message: 'Gagal Membuat Akun');
      }
    } catch (e) {
      BasicAppSnackbar().show(SnackbarType.error, message: 'Terjadi Kesalahan');
    }
  }
}
