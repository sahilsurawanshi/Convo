import 'dart:ui';
import 'package:convo/core/components/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:convo/core/extension/num_extension.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameCtrl = TextEditingController(text: "You");
  final TextEditingController bioCtrl = TextEditingController(
    text: "your quiet space",
  );

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
                  Color(0xFF333333),
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

          SafeArea(
            child: Column(
              children: [
                // 🔝 App bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      Text(
                        "Edit profile",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: Fonts.jSBold,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48), // balance
                    ],
                  ),
                ),

                20.heightBox,

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        10.heightBox,

                        // 👤 Avatar
                        GestureDetector(
                          onTap: () {
                            // TODO: pick image later
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.25),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 56,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        10.heightBox,

                        Text(
                          "Tap to change photo",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
                        ),

                        30.heightBox,

                        // ✏️ Name
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),

                        8.heightBox,

                        CustomTextField(
                          hint: "Your name",
                          controller: nameCtrl,
                        ),

                        22.heightBox,

                        // 📝 Bio
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Bio",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),

                        8.heightBox,

                        CustomTextField(
                          hint: "Say something about yourself",
                          controller: bioCtrl,
                        ),

                        40.heightBox,

                        SizedBox(
                          width: double.infinity,
                          height: 46.h,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.45),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Save changes"),
                          ),
                        ),

                        20.heightBox,
                      ],
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
