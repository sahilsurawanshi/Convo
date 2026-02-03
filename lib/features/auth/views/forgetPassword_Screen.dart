import 'dart:ui';
import 'package:convo/core/const/colours.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:convo/core/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:convo/core/components/customtextfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// 🔥 CONVO BEHIND
          Positioned(
            top: 120.h,
            child: Text(
              "CONVO",
              style: TextStyle(
                fontSize: 52.sp,
                letterSpacing: 8,
                fontFamily: Fonts.jSExtraBold,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.white.withOpacity(0.6), blurRadius: 35),
                ],
              ),
            ),
          ),

          /// 🌑 BACKGROUND
          Container(decoration: BoxDecoration(gradient: Colours.bgGradient)),

          /// 🧊 GLASS CARD
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 26.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(28.r),
                    border: Border.all(color: Colors.white.withOpacity(0.25)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "RESET PASSWORD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontFamily: Fonts.jSBold,
                          letterSpacing: 2,
                        ),
                      ),

                      10.heightBox,

                      const Text(
                        "Enter your email and we’ll send you a reset link.",
                        style: TextStyle(color: Colors.white70),
                      ),

                      22.heightBox,

                      CustomTextField(
                        hint: "Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),

                      22.heightBox,

                      SizedBox(
                        width: double.infinity,
                        height: 46.h,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.4),
                          ),
                          onPressed: () {},
                          child: const Text("Send reset link"),
                        ),
                      ),

                      12.heightBox,

                      Center(
                        child: TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            "Back to login",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
