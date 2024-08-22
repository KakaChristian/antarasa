import 'package:get/get.dart';

import '../../../core/routes/app_pages.dart';

class SplashController extends GetxController {
  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offNamed(Routes.INTRO);
  }
}
