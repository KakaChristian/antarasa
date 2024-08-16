import 'package:get/get.dart';

import '../../features/auth/auth/bindings/auth_binding.dart';
import '../../features/auth/auth/views/auth_view.dart';
import '../../features/auth/login/bindings/login_binding.dart';
import '../../features/auth/login/views/login_view.dart';
import '../../features/auth/signup/bindings/signup_binding.dart';
import '../../features/auth/signup/views/signup_view.dart';
import '../../features/intro/bindings/intro_binding.dart';
import '../../features/intro/views/intro_view.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
