import 'package:antarasa/app/features/auth/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_pages.dart';

class SplashController extends GetxController {
  final AuthController _authController = Get.put(AuthController());

  Future<void> redirect() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await _authController.autoLogin();
      if (!Get.currentRoute.contains(Routes.NAVIGATION)) {
        Get.offNamed(Routes.INTRO);
      }
    } catch (e) {
      print("Error during redirection: $e");
    }
  }
}
