import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/community.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/views/profile.dart';

class Mymentorshipprogram extends StatefulWidget {
  const Mymentorshipprogram({super.key});

  @override
  State<Mymentorshipprogram> createState() => _MymentorshipprogramState();
}

class _MymentorshipprogramState extends State<Mymentorshipprogram> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.handshake, size: 60, color: Colors.blue),

            SizedBox(height: 20),

            Text(
              "Mentorship Program",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Connect with mentors and improve your skills.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // Join mentorship
              },
              child: Text("Join Mentorship"),
            ),
          ],
        ),
      ),
    );
  }
}
