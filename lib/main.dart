import 'package:antarasa/app/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/config/themes/app_themes.dart';
import 'app/core/routes/app_pages.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnnonKey,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Antarasa",
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
