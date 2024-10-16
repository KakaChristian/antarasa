import 'package:get/get.dart';

class MenuListController extends GetxController {
  var menuList = <String>[
    'Restoran Sari Rasa',
    'Restoran Sejahtera',
    'Restoran Harmoni',
    'Restoran Makmur',
    'Restoran Nusantara',
    'Restoran Indah',
  ].obs;

  var filteredMenuList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredMenuList.assignAll(menuList);
  }

  void updateSearchResults(String query) {
    if (query.isEmpty) {
      filteredMenuList.assignAll(menuList);
    } else {
      filteredMenuList.assignAll(
        menuList.where(
          (menu) => menu.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  List<String> get suggestions => menuList.toList();
}
