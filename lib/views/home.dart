// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/community.dart';
import 'package:flutter_application_1/views/mentorship.dart';
import 'package:flutter_application_1/views/profile.dart';
// ignore: unused_import
import 'package:get/get_connect.dart';

List titles = ["Mentorship Programs", "Achievments"];
List iconData = [Icons.person_3_rounded, Icons.celebration];
List values = ["4 available", "10 "];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 15),
          Icon(Icons.pentagon_rounded, size: 15),
          Icon(Icons.people, size: 15),
          Icon(Icons.person, size: 15),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Mymentorshipprogram(),
              ),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Community()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
          //Handle button tap
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: secondaryColour,
        foregroundColor: const Color.fromARGB(255, 250, 247, 245),
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Youth", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            itemCount: titles.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    // ignore: duplicate_ignore
                    // ignore: deprecated_member_use
                    color: secondaryColour.withOpacity(0.1),
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
                        color: secondaryColour.withOpacity(0.1),
                      ),
                      Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 16,
                          decorationColor: secondaryColour,
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
    );
  }
}

class ProfilePage {
  const ProfilePage();
}
