import 'dart:ui';
import 'package:convo/core/extension/num_extension.dart';
import 'package:convo/features/auth/views/forgetPassword_Screen.dart';
import 'package:convo/features/auth/views/signUp_screen.dart';
import 'package:convo/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/components/customtextfield.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GlassLoginCard extends StatelessWidget {
  const GlassLoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 26.h),
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
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontFamily: Fonts.jSBold,
                      letterSpacing: 2,
                    ),
                  ),

                  25.heightBox,

                  CustomTextField(
                    hint: "Email or username",
                    prefixIcon: const Icon(Icons.person_outline),
                  ),

                  16.heightBox,

                  CustomTextField(
                    hint: "Password",
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),

                  10.heightBox,

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ForgotPasswordScreen());
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),

                  14.heightBox,

                  SizedBox(
                    width: double.infinity,
                    height: 46.h,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.4),
                      ),
                      onPressed: () {
                        Get.to(() => HomeScreen());
                      },
                      child: Text("Login"),
                    ),
                  ),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
