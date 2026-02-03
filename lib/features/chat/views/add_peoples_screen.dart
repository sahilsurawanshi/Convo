import 'dart:ui';
import 'package:convo/core/components/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/extension/num_extension.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddPeopleScreen extends StatelessWidget {
  const AddPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌑 Background
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

          // 🌫 Blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔝 App bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                      const Spacer(),
                      Text(
                        "New Message",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: Fonts.jSBold,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                12.heightBox,

                // 🔍 Search
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                    hint: "Search people",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),

                18.heightBox,

                // ⚡ Quick actions (Telegram-style)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      _actionTile(Icons.group, "New Group"),
                      _actionTile(Icons.person_add, "Invite Person"),
                      _actionTile(Icons.campaign, "New Channel"),
                    ],
                  ),
                ),

                20.heightBox,

                // 🔸 Section hint
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Text(
                    "People",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12.sp,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                10.heightBox,

                // 👥 People list
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _personTile("Unknown", "active now", true),
                      _personTile("Maya", "online", true),
                      _personTile("Aarav", "last seen today", false),
                      _personTile("R", "last seen recently", false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Action tile
  Widget _actionTile(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                14.widthBox,
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Fonts.jSMedium,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 👤 Person tile
  Widget _personTile(String name, String subtitle, bool online) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white24,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                12.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Fonts.jSBold,
                        fontSize: 15.sp,
                      ),
                    ),
                    4.heightBox,
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
