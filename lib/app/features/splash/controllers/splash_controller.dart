import '../../../core/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offNamed(Routes.INTRO);
  }
}
