import 'dart:ui';
import 'package:convo/core/const/colours.dart';
import 'package:convo/core/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:convo/core/components/customtextfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: Colours.bgGradient)),

          // 🔹 Global blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.12)),
          ),

          // 🔹 Brand
          Positioned(
            top: 90.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "CONVO",
                style: TextStyle(
                  fontSize: 36.sp,
                  letterSpacing: 6,
                  fontFamily: Fonts.jSExtraBold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.white.withOpacity(0.8),
                      blurRadius: 25,
                    ),
                    Shadow(
                      color: Colors.white.withOpacity(0.6),
                      blurRadius: 100,
                    ),
                    Shadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 🔹 Glass Card + bottom text
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 160.h, left: 22.w, right: 22.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🧊 Glass Card
                    ClipRRect(
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
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CREATE ACCOUNT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontFamily: Fonts.jSBold,
                                  letterSpacing: 1.5,
                                ),
                              ),

                              25.heightBox,

                              CustomTextField(
                                hint: "Full name",
                                prefixIcon: const Icon(Icons.person_outline),
                              ),

                              16.heightBox,

                              CustomTextField(
                                hint: "Email",
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: const Icon(Icons.email_outlined),
                              ),

                              16.heightBox,

                              CustomTextField(
                                hint: "Password",
                                obscureText: true,
                                prefixIcon: const Icon(Icons.lock_outline),
                              ),

                              16.heightBox,

                              CustomTextField(
                                hint: "Confirm password",
                                obscureText: true,
                                prefixIcon: const Icon(Icons.lock_outline),
                              ),

                              22.heightBox,

                              SizedBox(
                                width: double.infinity,
                                height: 46.h,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(
                                      0.4,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text("Create account"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    22.heightBox,

                    // 🔹 Bottom text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign in",
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
        ],
      ),
    );
  }
}
