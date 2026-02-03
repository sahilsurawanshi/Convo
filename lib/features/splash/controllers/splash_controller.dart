import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxDouble logoOpacity = 0.0.obs;
  RxDouble textOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    startSequence();
  }

  Future<void> startSequence() async {
    // small start delay
    await Future.delayed(const Duration(milliseconds: 400));

    // 1. logo fade in
    logoOpacity.value = 1.0;

    await Future.delayed(const Duration(milliseconds: 800));

    // 2. text fade in
    textOpacity.value = 1.0;

    await Future.delayed(const Duration(seconds: 1));

    // 3. text fade out
    textOpacity.value = 0.0;

    await Future.delayed(const Duration(milliseconds: 700));

    // 4. logo fade out
    logoOpacity.value = 0.0;

    // ✅ FINAL DELAY BEFORE AUTH
    await Future.delayed(const Duration(milliseconds: 900));

    // 5. go to auth (sign in)
    Get.offAllNamed('/signIn');
  }
}
