import 'dart:ui';
import 'package:convo/core/components/convo_painter.dart';
import 'package:convo/core/const/assets.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:convo/features/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(size: Size.infinite, painter: ConvoSplashPainter()),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(color: Colors.black.withOpacity(0.08)),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 LOGO
                Obx(
                  () => AnimatedOpacity(
                    opacity: controller.logoOpacity.value,
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeInOut,
                    child: Image.asset(Assets.logo2, height: 500),
                  ),
                ),
                Obx(
                  () => AnimatedOpacity(
                    opacity: controller.textOpacity.value,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    child: Text(
                      "CONVO",
                      style: TextStyle(
                        fontSize: 36.sp,
                        letterSpacing: 6,
                        fontFamily: Fonts.jSExtraBold,
                        color: Colors.white,
                        shadows: [
                          Shadow(color: Colors.white, blurRadius: 25),
                          Shadow(color: Colors.white, blurRadius: 40),
                          Shadow(color: Color(0xffE5E5E5), blurRadius: 60),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
