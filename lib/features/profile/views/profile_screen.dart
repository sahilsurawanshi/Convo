import 'dart:ui';
import 'package:convo/core/extension/num_extension.dart';
import 'package:convo/features/profile/views/edit_profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo/core/const/fonts.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFC6C6C6),
                  Color(0xFF999999),
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                ],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.15)),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.heightBox,

                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
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
                          size: 58,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  16.heightBox,

                  Text(
                    "You",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: Fonts.jSBold,
                      letterSpacing: 1,
                    ),
                  ),

                  6.heightBox,

                  Text(
                    "your quiet space",
                    style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                  ),

                  28.heightBox,

                  // 🧊 Presence stats
                  _glassSection(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _stat("Posts", "5"),
                        _stat("Convos", "12"),
                        _stat("Saved", "3"),
                      ],
                    ),
                  ),

                  22.heightBox,

                  // 🧊 My moments (mini gallery)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My moments",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.sp,
                        fontFamily: Fonts.jSMedium,
                      ),
                    ),
                  ),

                  12.heightBox,

                  _glassSection(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: Colors.white.withOpacity(0.15),
                            child: const Icon(
                              Icons.image,
                              color: Colors.white54,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  24.heightBox,

                  // 🧊 Controls
                  _glassSection(
                    child: Column(
                      children: [
                        _action(
                          Icons.edit,
                          "Edit profile",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditProfileScreen(),
                              ),
                            );
                          },
                        ),

                        _action(Icons.lock_outline, "Privacy"),
                        _action(Icons.settings_outlined, "Settings"),
                        _action(Icons.logout, "Sign out", danger: true),
                      ],
                    ),
                  ),

                  30.heightBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- components ----------

  Widget _glassSection({required Widget child}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _stat(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
        4.heightBox,
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _action(
    IconData icon,
    String title, {
    bool danger = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: danger ? Colors.redAccent : Colors.white70),
      title: Text(
        title,
        style: TextStyle(color: danger ? Colors.redAccent : Colors.white),
      ),
      onTap: onTap,
    );
  }
}
