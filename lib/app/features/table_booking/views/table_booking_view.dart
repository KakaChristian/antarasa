import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/table_booking_controller.dart';

class TableBookingView extends GetView<TableBookingController> {
  const TableBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableBookingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TableBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
