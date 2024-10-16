import 'package:get/get.dart';

import '../../../core/routes/app_pages.dart';
import '../../../core/utils/constant/constant.dart';

class ProfileController extends GetxController {
  var userName = ''.obs;
  var fullName = ''.obs;
  var email = ''.obs;

  Future<void> fetchUserProfile() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final data = await supabase
          .from('users')
          .select('user_name, full_name, email')
          .eq('user_id', user.id)
          .single();
      if (data.isNotEmpty) {
        userName.value = data['user_name'] ?? '';
        fullName.value = data['full_name'] ?? '';
        email.value = data['email'] ?? '';
      }
    }
  }

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!isClosed) {
      return Get.offNamed(Routes.AUTH);
    }
  }
}
