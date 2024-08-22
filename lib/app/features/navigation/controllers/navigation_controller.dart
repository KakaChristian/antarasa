import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  int selectedIndex = 0;

  final PageController pageController = PageController(initialPage: 0);

  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
