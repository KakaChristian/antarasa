import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var currentTab = 0.obs;
  var pageController = PageController().obs;

  void showSignUp() {
    currentTab.value = 0;
    pageController.value.jumpToPage(0);
  }

  void showLogin() {
    currentTab.value = 1;
    pageController.value.jumpToPage(1);
  }
}
