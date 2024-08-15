import 'package:antarasa/app/features/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/assets/app_images.dart';

// ignore: must_be_immutable
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = SplashController();

  @override
  void initState() {
    controller.redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashLogo),
            scale: 2,
          ),
        ),
      ),
    );
  }
}
