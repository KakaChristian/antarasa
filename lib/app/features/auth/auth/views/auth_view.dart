import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/config/assets/app_images.dart';
import '../../../../core/config/themes/app_colors.dart';
import '../../login/views/login_view.dart';
import '../../signup/views/signup_view.dart';
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
              decoration: BoxDecoration(
                color: AppColors.lightBackgroundColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(40),
                  topEnd: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(.1),
                    spreadRadius: 2,
                  )
                ],
              ),
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

                  // Navigation Bar
                  Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => controller.showSignUp(),
                            child: Column(
                              children: [
                                Text(
                                  'Buat Akun',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: controller.currentTab.value == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: controller.currentTab.value == 0
                                        ? AppColors.black
                                        : AppColors.grey,
                                  ),
                                ),
                                if (controller.currentTab.value == 0)
                                  Container(
                                    height: 3.5,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.showLogin(),
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: controller.currentTab.value == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: controller.currentTab.value == 1
                                        ? AppColors.black
                                        : AppColors.grey,
                                  ),
                                ),
                                if (controller.currentTab.value == 1)
                                  Container(
                                    height: 3.5,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: 500,
                  child: Obx(() {
                    return PageView(
                      controller: controller.pageController.value,
                      onPageChanged: (value) {
                        if (value == 0) {
                          controller.showSignUp();
                        } else {
                          controller.showLogin();
                        }
                      },
                      children: const [
                        SignupView(),
                        LoginView(),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
