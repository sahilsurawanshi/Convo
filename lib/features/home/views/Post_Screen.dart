import 'dart:ui';
import 'package:convo/core/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌑 Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFC6C6C6),
                  Color(0xFF999999),
                  Color(0xFF666666),
                  Color(0xFF000000),
                  Color(0xFF000000),
                ],
              ),
            ),
          ),

          // 🌫 Global blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.15)),
          ),

          // 🧘 Posts feed
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.heightBox,

                  // 🔝 Header with Add button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Moments",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontFamily: Fonts.jSBold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () {
                                // TODO → open create post screen
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  20.heightBox,

                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _imagePost(
                          image: "https://picsum.photos/400/600",
                          text: "I don’t know why this made me feel calm.",
                          name: "Maya",
                          time: "5m",
                        ),

                        _imagePost(
                          image: "https://picsum.photos/500/700",
                          text: null,
                          name: "R",
                          time: "20m",
                        ),

                        _imagePost(
                          image: "https://picsum.photos/420/620",
                          text: "Just a quiet evening.",
                          name: "Unknown",
                          time: "1h",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🧊 Hybrid glass post
  Widget _imagePost({
    required String image,
    String? text,
    required String name,
    required String time,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼 image
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26.r),
                  ),
                  child: Image.network(
                    image,
                    height: 220.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (text != null) ...[
                        Text(
                          text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            height: 1.4,
                          ),
                        ),
                        12.heightBox,
                      ],

                      // 👤 footer
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white24,
                            child: const Icon(
                              Icons.person,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                          8.widthBox,
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            time,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
