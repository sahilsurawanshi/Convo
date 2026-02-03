import 'package:convo/core/components/navbar.dart';
import 'package:convo/features/chat/views/chat_screen.dart';
import 'package:convo/features/home/views/Post_Screen.dart';
import 'package:convo/features/home/views/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    ChatScreen(),
    PostScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pages[currentIndex],

          Align(
            alignment: Alignment.bottomCenter,
            child: ConvoBottomNav(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
