import 'package:antarasa/app/common/widgets/button/basic_app_button.dart';
import 'package:antarasa/app/core/config/assets/app_images.dart';
import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:antarasa/app/common/widgets/date_picker/basic_app_date_picker.dart';

import '../controllers/table_booking_controller.dart';

class TableBookingView extends GetView<TableBookingController> {
  const TableBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    int avaTable = 0;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBackgroundColor,
        image: DecorationImage(
          image: AssetImage(
            AppImages.antarasaBg,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                    const SizedBox(width: 30),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Booking Meja",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 2,
                    child: Container(
                      height: 520,
                      width: 360,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(children: [
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            const Text(
                              "Meja Tersedia Saat Ini :",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 25),
                            _greyContainer(text: "0/0"),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            _dotText(text: "Jumlah Meja :"),
                            const SizedBox(width: 48),
                            sumTextfield(context, controller.jMController)
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            _dotText(text: "Jumlah Orang :"),
                            const SizedBox(width: 39),
                            sumTextfield(context, controller.jOController)
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            _dotText(text: "Hari :"),
                            _dotText(text: "Tanggal :"),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const SizedBox(width: 60),
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Senin",
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  BasicAppDatePicker().selectDate(
                                      context: context, selectionType: "Date");
                                },
                                controller: controller.dayController,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 30,
                              width: 160,
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 28),
                                  hintText: "0000-00-00",
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  BasicAppDatePicker().selectDate(
                                      context: context, selectionType: "Date");
                                },
                                controller: controller.dateController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [_dotText(text: "Waktu :")],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const SizedBox(width: 60),
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "00:00 AM",
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  BasicAppDatePicker().selectDate(
                                      context: context, selectionType: "Time");
                                },
                                controller: controller.timeController,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextField(
                              controller: controller.catatanController,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Catatan . . .',
                                hintStyle: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ).applyDefaults(
                                Theme.of(context).inputDecorationTheme,
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: BasicAppButton(
                    onPressed: (avaTable == 0) ? null : () {},
                    title: "Check In",
                    height: 40,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _dotText({required String text}) {
  return Row(
    children: [
      const SizedBox(width: 55),
      const Icon(
        Icons.circle,
        size: 12,
      ),
      const SizedBox(width: 10),
      Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget _greyContainer({
  required dynamic text,
  double height = 30,
  double width = 90,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: const Color(0xffD9D9D9),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget sumTextfield(
  BuildContext context,
  TextEditingController controller,
) {
  return Container(
    height: 30,
    width: 90,
    decoration: BoxDecoration(
      color: const Color(0xffD9D9D9),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 44,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            textDirection: TextDirection.rtl,
            maxLength: 2,
            decoration: const InputDecoration(
              counterText: '',
              hintText: '0',
              hintTextDirection: TextDirection.rtl,
              alignLabelWithHint: true,
              filled: true,
              contentPadding: EdgeInsets.only(left: 21),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
          child: Text(
            '/0',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        )
      ],
    ),
  );
}
