import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../common/widgets/textfield/basic_app_textfield.dart';
import '../../../../core/config/assets/app_vectors.dart';
import '../../../../core/config/themes/app_colors.dart';
import '../../../../core/routes/app_pages.dart';
import '../../widgets/login_button.dart';
import '../../widgets/textfield_name.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textfieldName(name: 'Email'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              child: BasicAppTextfield(
                controller: controller.emailController,
              ),
            ),
            const SizedBox(height: 15),
            textfieldName(name: 'Password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
            InkWell(
              onTap: () {
                Get.toNamed(Routes.RECOVERY_PASSWORD);
              },
              child: Ink(
                padding: const EdgeInsets.only(left: 180, top: 10),
                child: const Text(
                  'Recovery Password',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 45),
            AuthButton(
              onPressed: () {
                controller.login();
              },
              text: 'Masuk',
              contentAxis: MainAxisAlignment.center,
            ),
            const SizedBox(height: 15),
            AuthButton(
              buttonBackgroundColor: const Color(0xfff4f4f4),
              onPressed: () {},
              text: 'Masuk Dengan Google',
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
