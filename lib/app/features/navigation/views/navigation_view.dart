// import 'package:antarasa/app/core/config/assets/app_vectors.dart';
import 'package:antarasa/app/features/menu_list/controllers/menu_list_controller.dart';
import 'package:antarasa/app/features/navigation/widgets/navigation_bar_item.dart';
import 'package:antarasa/app/features/order/views/order_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/themes/app_colors.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final controller = Get.put(NavigationController());

  final List<IconData> iconList = [
    MdiIcons.homeOutline,
    MdiIcons.food,
    MdiIcons.accountOutline
  ];

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(MenuListController());
    Get.put(ProfileController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.selectedIndex = index;
        },
        children: [
          // Home Page
          HomeView(),

          // Order Page
          const OrderView(),

          // Profile Page
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          color: AppColors.white,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          backgroundColor: AppColors.primaryColor,
          animationDuration: const Duration(milliseconds: 600),
          items: List.generate(
            3,
            (index) => NavigationBarItem(
              index: index,
              currentIndex: controller.currentIndex.value,
            ),
          ),
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
    );
  }
}
