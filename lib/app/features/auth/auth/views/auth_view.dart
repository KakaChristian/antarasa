import '../../../../core/config/assets/app_images.dart';
import '../../../../core/config/themes/app_colors.dart';
import '../../login/views/login_view.dart';
import '../../signup/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBackgroundColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(40),
                  topEnd: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    GestureDetector(
                      onVerticalDragDown: (details) =>
                          FocusScope.of(context).unfocus(
                        disposition: UnfocusDisposition.scope,
                      ),
                      child: Container(
                        height: 10,
                        width: 55,
                        decoration: const BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(40),
                            topEnd: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // _signupTab(context),
                        // _loginTab(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: SizedBox(
              height: 480,
              child: PageView(
                onPageChanged: (value) {},
                children: const [
                  SignupView(),
                  LoginView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
