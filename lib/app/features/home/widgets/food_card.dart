import '../../../core/config/assets/app_images.dart';
import '../../../core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(3),
      child: Container(
        width: 165,
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(AppImages.chicken_biryani),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Food Name
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Chicken Biryani',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Price
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rp. 30,000,00',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ),

            // Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Row(
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.green,
                    size: 16,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
