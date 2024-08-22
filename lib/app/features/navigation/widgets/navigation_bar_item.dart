import '../../../core/config/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget navigationBarItem(int index, int currentIndex) {
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
      icon = AppVectors.receiptIcon;
      activeIcon = AppVectors.receiptIconActive;
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
    
    width: width,
    index == currentIndex ? activeIcon : icon,
    fit: BoxFit.scaleDown,
  );
}
