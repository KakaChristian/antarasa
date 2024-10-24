import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/constant/constant.dart';
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

  Future<void> autoLogin() async {
    final sessionMap = await Constants.getBox.read("supabaseSession");

    if (sessionMap != null && sessionMap.isNotEmpty) {
      try {
        final accessToken = sessionMap['accessToken'];
        final refreshToken = sessionMap['refreshToken'];

        if (accessToken.isNotEmpty) {
          await Get.offNamed(Routes.NAVIGATION);
        } else {
          final refreshResponse =
              await supabase.auth.refreshSession(refreshToken);
          if (refreshResponse.session != null) {
            final newSession = refreshResponse.session;
            final newAccessToken = newSession!.accessToken;
            final newRefreshToken = newSession.refreshToken;

            final newSessionMap = {
              "accessToken": newAccessToken,
              "refreshToken": newRefreshToken,
            };

            await Constants.getBox.write("supabaseSession", newSessionMap);
            await Get.offNamed(Routes.NAVIGATION);
          } else {
            await Constants.getBox.remove('supabaseSession');
            print("No valid session found in GetStorage");
          }
        }
      } catch (e) {
        print("Error during autoLogin: $e");
      }
    }
  }
}
