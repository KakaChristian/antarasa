import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/config/themes/app_colors.dart';
import '../widgets/food_card.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/assets/app_images.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 70),
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
                                borderRadius: BorderRadius.circular(16),
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
                  const SizedBox(height: 10),
                  PageIndicator(dotCount: controller.images.length),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 200, left: 25),
                    child: BasicAppButton(
                      height: 40,
                      onPressed: () {},
                      title: 'Pesanan',
                      backgroundColor: AppColors.lightGreen,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 130),
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
                          onTap: () {},
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
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
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
              const HomeSearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}
