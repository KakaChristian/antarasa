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
    // Menyimpan daftar menu awal ke dalam filteredMenuList
    filteredMenuList.addAll(menuList);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Daftar menu yang akan ditampilkan
  var menuList = <String>['Restoran 1', 'Restoran 2', 'Restoran 3'].obs;
  List<String> get suggestions => menuList.toList();
  var filteredMenuList = <String>[].obs;

  void updateSearchResults(String query) {
    if (query.isEmpty) {
      filteredMenuList.assignAll(menuList);
    } else {
      filteredMenuList.assignAll(menuList.where(
        (menu) => menu.toLowerCase().contains(query.toLowerCase()),
      ));
    }
  }
}
