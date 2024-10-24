import '../../../core/config/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;

  const NavigationBarItem({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    String icon;
    String activeIcon;
    double width;

    switch (index) {
      case 0:
        width = 20;
        icon = AppVectors.homeIcon;
        activeIcon = AppVectors.homeIconActive;
        break;
      case 1:
        width = 25;
        icon = AppVectors.orderIcon;
        activeIcon = AppVectors.orderIconActive;
        break;
      case 2:
        width = 20;
        icon = AppVectors.profileIcon;
        activeIcon = AppVectors.profileIconActive;
        break;
      default:
        width = 20;
        icon = AppVectors.homeIcon;
        activeIcon = AppVectors.homeIconActive;
    }

    return SvgPicture.asset(
      index == currentIndex ? activeIcon : icon,
      width: width,
      fit: BoxFit.scaleDown,
    );
  }
}
