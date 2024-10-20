import 'package:get/get.dart';

import '../controllers/table_booking_controller.dart';

class TableBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TableBookingController>(
      () => TableBookingController(),
    );
  }
}
