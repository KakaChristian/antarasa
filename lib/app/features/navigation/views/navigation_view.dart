import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/themes/app_colors.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../receipt/views/receipt_view.dart';
import '../controllers/navigation_controller.dart';
import '../widgets/navigation_bar_item.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final controller = Get.put(NavigationController());

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.selectedIndex = index;
        },
        children: const [
          // Home Page
          HomeView(),

          // Receipt Page
          ReceiptView(),

          // Profile Page
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          color: AppColors.lightBackgroundColor,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          backgroundColor: AppColors.primaryColor,
          animationDuration: const Duration(milliseconds: 600),
          items: List.generate(
            3,
            (index) => navigationBarItem(index, controller.currentIndex.value),
          ),
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
    );
  }
}
