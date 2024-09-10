import 'package:antarasa/app/core/routes/app_pages.dart';
import 'package:antarasa/app/core/utils/constant/constant.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!isClosed) {
      return Get.offNamed(Routes.AUTH);
    }
  }
}
