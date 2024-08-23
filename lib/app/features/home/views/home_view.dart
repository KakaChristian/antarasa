import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/assets/app_images.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.lightBackgroundColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.antarasaBg),
        ),
      ),
      child: const SafeArea(
        child: Scaffold(
          
          backgroundColor: Colors.transparent,
          body: Column(
            children: [SearchBar()],
          ),
        ),
      ),
    );
  }
}
