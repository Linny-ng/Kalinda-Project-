// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/community.dart';
import 'package:flutter_application_1/views/mentorship.dart';
import 'package:flutter_application_1/views/profile.dart';
// ignore: unused_import
import 'package:get/get_connect.dart';

List titles = ["Mentorship Programs", "Achievments", "Community", "Profile"];
List iconData = [
  Icons.person_3_rounded,
  Icons.celebration,
  Icons.group,
  Icons.person,
];
List values = [
  "Connecting youth with mentors to inspire growth.",
  "Celebrating the accomplishments of our youth community.",
  "Building a supportive network for all members.",
  "Showcasing individual journeys and milestones.",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: primaryColour,
        foregroundColor: secondaryColour,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Youth",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              itemCount: titles.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      // ignore: duplicate_ignore
                      // ignore: deprecated_member_use
                      color: primaryColour.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: duplicate_ignore
                        // ignore: deprecated_member_use
                        Icon(
                          iconData[index],
                          size: 50,
                          color: primaryColour.withOpacity(0.1),
                        ),
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 16,
                            decorationColor: primaryColour,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(values[index]),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage {
  const ProfilePage();
}
