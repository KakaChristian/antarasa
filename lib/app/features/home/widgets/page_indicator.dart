import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:antarasa/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageIndicator extends StatelessWidget {
  final int dotCount;

  const PageIndicator({super.key, required this.dotCount});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          dotCount,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: controller.currentIndex.value == index ? 12.0 : 8.0,
            height: controller.currentIndex.value == index ? 12.0 : 8.0,
            decoration: BoxDecoration(
              color: controller.currentIndex.value == index
                  ? AppColors.primaryColor
                  : AppColors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
