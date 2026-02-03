import 'package:convo/core/const/app_routes.dart';
import 'package:convo/core/const/getx_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ConvoApp());
}

class ConvoApp extends StatelessWidget {
  const ConvoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: AppRoutes.splashScreen,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          title: "CONVO",
        );
      },
    );
  }
}
