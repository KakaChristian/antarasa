import 'package:get/get.dart';

class IntroController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
