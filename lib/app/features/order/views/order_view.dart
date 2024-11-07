import 'package:antarasa/app/core/config/assets/app_images.dart';
import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 10;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBackgroundColor,
        image: DecorationImage(
          image: AssetImage(AppImages.antarasaBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Pesanan",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 370,
                width: 370,
                color: Colors.transparent,
                child: Scrollbar(
                  controller: controller.scrollController,
                  thumbVisibility: true,
                  thickness: 7,
                  radius: const Radius.circular(10),
                  child: ListView.builder(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: index,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.2),
                                blurRadius: 1.5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Nasi Goreng",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sticky_note_2_outlined,
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(width: 5),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Notes",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.add,
                                    color: AppColors.primaryColor,
                                    size: 26,
                                  ),
                                  onPressed: () {
                                    // Tambahkan aksi ketika button ditekan
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: AppColors.primaryColor,
                                    size: 26,
                                  ),
                                  onPressed: () {
                                    // Tambahkan aksi ketika button ditekan
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Rp. 30.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(
                color: AppColors.black,
                thickness: 1,
                height: 20,
                indent: 20,
                endIndent: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Total Barang :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '$index',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Total Harga :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Rp. 300.000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: (index == 0) ? null : () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      disabledBackgroundColor: AppColors.grey,
                      // disabledForegroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text(
                      "Pembayaran",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
