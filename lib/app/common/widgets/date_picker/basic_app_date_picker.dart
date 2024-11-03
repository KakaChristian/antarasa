import 'package:antarasa/app/core/config/themes/app_colors.dart';
import 'package:antarasa/app/features/table_booking/controllers/table_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BasicAppDatePicker {
  Future<void> selectDate({
    required BuildContext context,
    required String selectionType,
  }) async {
    final dateController = Get.find<TableBookingController>();

    Intl.defaultLocale = 'id_ID';

    if (selectionType == "Date") {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2080),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.lightBackgroundColor,
                onSurface: AppColors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        // Format tanggal sesuai kebutuhan (misalnya hanya tanggal)
         dateController.dateController.text =
            DateFormat('yyyy-MM-dd').format(picked);
        dateController.dayController.text =
            DateFormat('EEEE', 'id_ID').format(picked);
      }
    } else if (selectionType == "Time") {
      TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.lightBackgroundColor,
                onSurface: AppColors.black,
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        // Format waktu sesuai kebutuhan (misalnya hanya waktu)
        dateController.timeController.text = picked.format(context);
      }
    }
  }
}
