import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/views/mentorship.dart';
import 'package:flutter_application_1/views/community.dart';
import 'package:flutter_application_1/views/profile.dart';

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;

  // Screen list matched to tab order
  final List<Widget> _screens = const [
    HomeScreen(),
    Mymentorshipprogram(),
    Community(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps screen state alive and prevents route-stack bugs
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: primaryColour,
            ),

            /// Mentorship
            SalomonBottomBarItem(
              icon: const Icon(Icons.workspace_premium),
              title: const Text("Mentorship"),
              selectedColor: Colors.purple,
            ),

            /// Community
            SalomonBottomBarItem(
              icon: const Icon(Icons.people),
              title: const Text("Community"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
