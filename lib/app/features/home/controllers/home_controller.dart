import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/assets/app_images.dart';

class HomeController extends GetxController {
  late PageController pageController = PageController();

  final List<String> images = [
    AppImages.new_menu, // Pastikan path gambar sesuai
    AppImages.new_menu, // Ganti dengan gambar lain jika ada
    AppImages.new_menu, // Ganti dengan gambar lain jika ada
  ];

  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    pageController.addListener(() {
      int newIndex = pageController.page?.round() ?? 0;
      if (currentIndex.value != newIndex) {
        currentIndex.value = newIndex;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
