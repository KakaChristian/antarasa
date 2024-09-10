import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../common/widgets/textfield/basic_app_textfield.dart';
import '../../../../core/config/assets/app_vectors.dart';
import '../../../../core/config/themes/app_colors.dart';

import '../../widgets/login_button.dart';
import '../../widgets/textfield_name.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textfieldName(
              name: 'Nama Lengkap',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),

              // FullName Textfield
              child: BasicAppTextfield(
                controller: controller.fullNameController,
              ),
            ),
            const SizedBox(height: 15),
            textfieldName(name: 'Alamat Email'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),

              // Email Textfield
              child: BasicAppTextfield(
                controller: controller.emailController,
              ),
            ),
            const SizedBox(height: 15),
            textfieldName(name: 'Password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),

              // Password Textfield
              child: Obx(() => BasicAppTextfield(
                    controller: controller.passwordController,
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? MdiIcons.eyeOffOutline
                          : MdiIcons.eyeOutline,
                    ),
                    obscureText: controller.isPasswordVisible.value,
                    onPressedIcon: controller.togglePasswordVisibility,
                  )),
            ),
            const SizedBox(height: 15),
            AuthButton(
              onPressed: () {
                controller.signup();
              },
              text: 'Buat Akun',
              contentAxis: MainAxisAlignment.center,
            ),
            const SizedBox(height: 15),
            AuthButton(
              buttonBackgroundColor: const Color(0xfff4f4f4),
              onPressed: () {},
              text: 'Daftar Dengan Google',
              style: const TextStyle(color: AppColors.primaryColor),
              contentAxis: MainAxisAlignment.spaceBetween,
              icon: SvgPicture.asset(AppVectors.googleIcon),
            ),
            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}
