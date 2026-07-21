import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("kalinda youth"),
        backgroundColor: secondaryColour,
        foregroundColor: const Color.fromARGB(255, 250, 247, 245),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("logo.png", height: 200, width: 400)],
            ),
            SizedBox(height: 15),

            Text(
              "Username:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Password:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 26, 25, 21),
              ),
            ),

            SizedBox(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/home");
                  },
                  color: primaryColour,
                  hoverColor: secondaryColour,
                  hoverElevation: 10.0,
                  highlightElevation: 20.0,
                  height: 45,
                  child: Text("logIn"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    "Not registered? Sign Up",
                    style: TextStyle(color: primaryColour),
                  ),
                  onTap: () {
                    // code to navigate to registration page
                    Get.toNamed("/register");
                  },
                ),
                SizedBox(width: 30),
                Text(
                  "Forgot Password? Reset",
                  style: TextStyle(color: primaryColour),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
