import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var store = GetStorage();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    usernameController.text = store.read("username") ?? "";
    return Scaffold(
      backgroundColor: secondaryColour,
      appBar: AppBar(
        centerTitle: true,
        title: Text("kalinda youth"),
        backgroundColor: primaryColour,
        foregroundColor: const Color.fromARGB(255, 243, 245, 245),
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
                controller: usernameController,
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
                color: const Color.fromARGB(255, 19, 14, 7),
              ),
            ),

            SizedBox(
              width: 500,
              child: TextField(
                controller: passwordController,
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
                  onPressed: () async {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      Get.snackbar("Error", "Please fill all the fields");
                      return;
                    } else {
                      var response = await http.get(
                        Uri.parse(
                          "http://localhost/kalindayouth/login.php?phonenumber=${usernameController.text}&password=${passwordController.text}",
                        ),
                      );
                    }

                    store.write("username", usernameController.text);
                    Get.toNamed("/home");
                    Get.snackbar("Success", "Logged in successfully");
                  },
                  color: primaryColour,
                  hoverColor: const Color.fromARGB(255, 107, 75, 16),
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
