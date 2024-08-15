import 'package:get/get.dart';

import '../../features/auth/auth/presentation/bindings/auth_binding.dart';
import '../../features/auth/auth/presentation/views/auth_view.dart';
import '../../features/auth/login/presentation/bindings/login_binding.dart';
import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/signup/presentation/bindings/signup_binding.dart';
import '../../features/auth/signup/presentation/views/signup_view.dart';
import '../../features/intro/presentation/bindings/intro_binding.dart';
import '../../features/intro/presentation/views/intro_view.dart';
import '../../features/splash/presentation/bindings/splash_binding.dart';
import '../../features/splash/presentation/views/splash_view.dart';

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
