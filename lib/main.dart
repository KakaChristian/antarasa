import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Antarasa",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
