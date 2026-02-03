import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvoBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ConvoBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 18.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            height: 64.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(Icons.chat_bubble_outline, "Chats", 0),
                _navItem(Icons.person_outline, "Posts", 1),
                _navItem(Icons.grid_view_rounded, "Profile", 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white54,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white54,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
