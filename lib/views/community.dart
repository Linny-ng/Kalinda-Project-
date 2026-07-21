import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/views/mentorship.dart';
import 'package:flutter_application_1/views/profile.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
          //Handle button tap
        },
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Community",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Connect, share and grow with other youth members",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Container(
                width: 300,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.people, size: 50, color: Colors.blue),

                    SizedBox(height: 15),

                    Text(
                      "Youth Community",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Join discussions, share ideas and interact with other members.",
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        // Open community page
                      },
                      child: Text("Join Community"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
