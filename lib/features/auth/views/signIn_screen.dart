import 'dart:ui';
import 'package:convo/core/components/glass_screen.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFC6C6C6),
                  Color(0xFF999999),
                  Color(0xFF666666),
                  Color(0xFF333333),
                  Color(0xFF000000),
                ],
              ),
            ),
          ),

          // 🔹 Global blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
            child: Container(color: Colors.black.withOpacity(0.100)),
          ),
          Positioned(
            top: 90.h,
            left: 0,
            right: 0, // ✅ this centers it horizontally
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
                      color: Colors.black.withOpacity(0.6),
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

          // 🔹 Glass login card
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: GlassLoginCard(),
              ),
            ),
          ),
          // 🔥 CONVO logo text (above card)
        ],
      ),
    );
  }
}
