import '../../../../common/widgets/textfield/basic_app_textfield.dart';
import '../../../../core/config/assets/app_vectors.dart';
import '../../../../core/config/themes/app_colors.dart';
import '../../widgets/login_button.dart';
import '../../widgets/textfield_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
            textfieldName(name: 'Email / Nama'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              child: BasicAppTextfield(),
            ),
            const SizedBox(height: 15),
            textfieldName(name: 'Password'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              child: BasicAppTextfield(),
            ),
            const SizedBox(height: 55),
            AuthButton(
              onPressed: () {},
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
