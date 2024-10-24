import '../../../common/widgets/searchbar/basic_app_search_bar.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/themes/app_colors.dart';
import '../widgets/menu_card.dart';
import '../controllers/menu_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuListView extends GetView<MenuListController> {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBackgroundColor,
        image: DecorationImage(
          image: AssetImage(AppImages.antarasaBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 4),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const MenuCard();
                  },
                ),
              ),
              BasicAppSearchBar(
                width: 300,
                onQueryChanged: (query) {
                  controller.updateSearchResults(query);
                },
                suggestions: controller.suggestions,
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
                          itemCount: controller.filteredMenuList.length,
                          itemBuilder: (context, index) {
                            final menu = controller.filteredMenuList[index];
                            return ListTile(
                              leading: const Icon(Icons.restaurant),
                              title: Text(menu),
                              onTap: () {},
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
