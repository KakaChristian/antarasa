import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/assets/app_images.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.antarasaBg),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
