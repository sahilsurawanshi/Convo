import 'package:convo/core/const/app_routes.dart';
import 'package:convo/features/auth/views/signIn_screen.dart';
import 'package:convo/features/chat/views/add_peoples_screen.dart';
import 'package:convo/features/home/views/convo_Screen.dart';
import 'package:convo/features/home/views/Post_Screen.dart';
import 'package:convo/features/profile/views/profile_screen.dart';
import 'package:convo/features/splash/views/splash_Screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final String initialRoute = AppRoutes.splashScreen;

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),

    GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
    GetPage(name: AppRoutes.spacesScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.postScreen, page: () => PostScreen()),
    GetPage(name: AppRoutes.convoScreen, page: () => ConvoScreen()),
    GetPage(name: AppRoutes.addpeoplesscreen, page: () => AddPeopleScreen()),
  ];
}
