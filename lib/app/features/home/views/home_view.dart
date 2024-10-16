import 'package:antarasa/app/common/widgets/searchbar/basic_app_search_bar.dart';
import 'package:antarasa/app/core/routes/app_pages.dart';
import 'package:antarasa/app/features/menu_list/controllers/menu_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/themes/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/food_card.dart';
import '../widgets/page_indicator.dart';
import '../../navigation/controllers/navigation_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final NavigationController navController = Get.find<NavigationController>();
  final MenuListController menuListController = Get.find<MenuListController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBackgroundColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.antarasaBg),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: Get.height * 0.1),
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: AssetImage(controller.images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  PageIndicator(dotCount: controller.images.length),
                  SizedBox(height: Get.height * 0.04),
                  Padding(
                    padding: const EdgeInsets.only(right: 200, left: 25),
                    child: BasicAppButton(
                      height: 40,
                      onPressed: () {},
                      title: 'Booking Meja',
                      backgroundColor: AppColors.lightGreen,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.08),
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Menu',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Cari makanan atau minuman favorit kamu',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.MENU_LIST,
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Lihat Semua',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: FoodCard(),
                      ),
                    ),
                  ),
                ],
              ),
              BasicAppSearchBar(
                width: 300,
                onQueryChanged: (query) {},
                suggestions: menuListController.suggestions,
                searchResultsBuilder: (context, transition) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: menuListController.filteredMenuList.length,
                          itemBuilder: (context, index) {
                            final menu =
                                menuListController.filteredMenuList[index];
                            return ListTile(
                              title: Text(menu),
                              onTap: () {
                                // Aksi saat item dipilih
                              },
                            );
                          },
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
