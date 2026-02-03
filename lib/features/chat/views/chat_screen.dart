import 'dart:ui';
import 'package:convo/core/const/colours.dart';
import 'package:convo/core/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';
import '../../home/views/convo_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: Colours.bgGradient)),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.15)),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.heightBox,
                  Text(
                    "CONVO",
                    style: TextStyle(
                      fontSize: 26.sp,
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

                  20.heightBox,
                  _glassSearchField(),
                  20.heightBox,

                  Expanded(
                    child: ListView(
                      children: [
                        _chatTile(
                          name: "Unknown",
                          message: "Hey… just wanted to talk.",
                          time: "Now",
                          online: true,
                          context: context,
                        ),
                        _chatTile(
                          name: "Aarav",
                          message: "That sounds calm.",
                          time: "2m",
                          online: true,
                          context: context,
                        ),
                        _chatTile(
                          name: "Maya",
                          message: "See you soon.",
                          time: "12m",
                          online: false,
                          context: context,
                        ),
                        _chatTile(
                          name: "R",
                          message: "Typing…",
                          time: "1h",
                          online: false,
                          context: context,
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

  // 🧊 Glass chat tile
  Widget _chatTile({
    required String name,
    required String message,
    required String time,
    required bool online,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ConvoScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(color: Colors.white.withOpacity(0.25)),
              ),
              child: Row(
                children: [
                  // 👤 Avatar
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white24,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      if (online)
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),

                  12.widthBox,

                  // 📝 Name + message
                  Expanded(
                    child: Column(
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
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ⏰ time
                  Text(
                    time,
                    style: TextStyle(color: Colors.white54, fontSize: 11.sp),
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

// ................................................TEXTFIELDS
Widget _glassSearchField() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(18.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.white.withOpacity(0.25)),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.white70),
            10.widthBox,
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Search conversations…",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
