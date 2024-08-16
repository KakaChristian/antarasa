import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/themes/app_colors.dart';
import '../../../core/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.antarasaBg),
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              _welcomeText(),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _requiredText(),
              ),
              const SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: BasicAppButton(
                  onPressed: () {
                    Get.offNamed(Routes.AUTH);
                  },
                  title: 'Ayo Mulai!',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 115),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: _agreementText(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText() {
  return Text(
    'Selamat Datang!',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.black.withOpacity(.8),
    ),
  );
}

Widget _requiredText() {
  return Text(
    'Sebelum Menggunakan Pelayanan Aplikasi Kami, Anda Harus Mempunyai Akun Terlebih Dahulu',
    style: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.black.withOpacity(.7),
    ),
    textAlign: TextAlign.center,
  );
}

Widget _agreementText() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: RichText(
      text: const TextSpan(
        text: 'By logging in or registering, you have agreed to ',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 11,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'the Terms and Conditions',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 11,
            ),
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 11,
            ),
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 11,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );
}
