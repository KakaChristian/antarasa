import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      leadingActions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ],
      backgroundColor: AppColors.lightBackgroundColor,
      hint: 'Cari...',
      scrollPadding: const EdgeInsets.only(
        top: 16,
        bottom: 56,
      ),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      width: 600,
      debounceDelay: const Duration(milliseconds: 500),
      borderRadius: BorderRadius.circular(28),
      onQueryChanged: (query) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: Container(),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return _buildSearchResults();
      },
    );
  }

  Widget _buildSearchResults() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Restoran 1'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Restoran 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
