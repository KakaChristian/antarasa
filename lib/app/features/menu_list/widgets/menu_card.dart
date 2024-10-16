import 'package:antarasa/app/core/config/assets/app_images.dart';
import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 200,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 130,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      image: DecorationImage(
                        image: AssetImage(AppImages.chicken_biryani),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.5, bottom: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(110, 25),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Tambah",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Chicken Biryani",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Ayam Biryani dengan Nasi Putih",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text("Rp. 30.000,00"),
                  const SizedBox(height: 35),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 16,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
