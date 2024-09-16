// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:antarasa/app/core/config/assets/app_images.dart';
import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:antarasa/app/features/profile/widgets/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.antarasaBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              // Profile Leading
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 50,
                ),
                child: Container(
                  width: double.infinity,
                  height: 85,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(.9),
                        spreadRadius: 0.1,
                        offset: const Offset(0, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 25),

                      // Profile Picture
                      ProfilePicture(
                        name: controller.fullName.value.capitalizeEach(),
                        radius: 21,
                        fontsize: 11,
                        tooltip: true,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        // Profile Name
                        children: [
                          Text(
                            controller.userName.value.capitalizeEach(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            controller.email.value,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      // Notification
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grey.withOpacity(.2),
                            border: Border.all(
                              color: AppColors.black.withOpacity(0.6),
                              width: 0.1,
                            ),
                          ),
                          child: const Icon(Icons.notifications_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(.9),
                        spreadRadius: 0.1,
                        offset: const Offset(0, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 3),
                      // Address
                      ProfileButton(
                        ontap: () {},
                        text: 'Alamat Saya',
                        leadingIcon: const Icon(Icons.map_outlined),
                      ),

                      // Language
                      ProfileButton(
                        ontap: () {},
                        text: 'Bahasa',
                        leadingIcon: const Icon(Icons.g_translate),
                      ),

                      // Account Settings
                      ProfileButton(
                        ontap: () {},
                        text: 'Pengaturan Akun',
                        leadingIcon: const Icon(Icons.account_circle_outlined),
                      ),

                      //  Feedback
                      ProfileButton(
                        ontap: () {},
                        text: 'Saran',
                        leadingIcon: const Icon(Icons.feedback_rounded),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  controller.signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  elevation: 0,
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
