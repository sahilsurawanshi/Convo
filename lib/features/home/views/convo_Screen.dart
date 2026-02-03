import 'dart:ui';
import 'package:convo/core/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';

class ConvoScreen extends StatelessWidget {
  const ConvoScreen({super.key});

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

          // 💬 Chat UI
          SafeArea(
            child: Column(
              children: [
                // 🔹 Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      const BackButton(color: Colors.white),
                      8.widthBox,
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white24,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Unknown",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Fonts.jSBold,
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "online",
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

                10.heightBox,

                // 🔹 Messages area
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    children: [
                      _receiverBubble("Hey…"),
                      _senderBubble("Hi. What’s up?"),
                      _receiverBubble("Nothing much. Just wanted to talk."),
                      _senderBubble("That’s calm. I’m here."),
                      _receiverBubble("This UI feels peaceful."),
                      _senderBubble("Yeah… that’s the idea."),
                    ],
                  ),
                ),

                // 🔹 Input area (glass)
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.25),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Colors.white70),
                            10.widthBox,
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: "Type something calm…",
                                  hintStyle: TextStyle(color: Colors.white54),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.send, color: Colors.white),
                            ),
                          ],
                        ),
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

  // 🌙 Receiver bubble
  Widget _receiverBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h, right: 60.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }

  // 🌑 Sender bubble
  Widget _senderBubble(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h, left: 60.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
