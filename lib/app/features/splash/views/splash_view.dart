import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/assets/app_images.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: splashController.redirect(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashLogo),
                  scale: 2,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error loading the app"),
            );
          } else {
            return Container(); 
          }
        },
      ),
    );
  }
}
