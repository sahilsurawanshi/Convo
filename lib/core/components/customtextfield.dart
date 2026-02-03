import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withOpacity(0.25)),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: TextStyle(
              fontFamily: Fonts.jSMedium,
              fontSize: 14.sp,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: Fonts.jSRegular,
                color: Colors.white54,
                fontSize: 13.sp,
              ),
              prefixIcon: prefixIcon == null
                  ? null
                  : IconTheme(
                      data: const IconThemeData(color: Colors.white70),
                      child: prefixIcon!,
                    ),
              suffixIcon: suffixIcon == null
                  ? null
                  : IconTheme(
                      data: const IconThemeData(color: Colors.white70),
                      child: suffixIcon!,
                    ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 14.h,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
