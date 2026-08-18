import 'dart:convert';
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
  bool isLoading = false;

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
              "Email or Phone:",
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
                obscureText: true,
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
                  onPressed: isLoading ? null : _handleLogin,
                  color: primaryColour,
                  hoverColor: const Color.fromARGB(255, 107, 75, 16),
                  hoverElevation: 10.0,
                  highlightElevation: 20.0,
                  height: 45,
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text("logIn"),
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

  Future<void> _handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.get(
        Uri.parse(
          "http://localhost/kalindayouth/login.php?phonenumber=${usernameController.text.trim()}&password=${passwordController.text.trim()}",
        ),
      );

      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == 1) {
        var user = responseBody['user'] ?? responseBody['data'];

        // Save user details to GetStorage
        store.write("user_id", user['id']);
        store.write("username", usernameController.text.trim());
        store.write("image", user['picture'] ?? user['image'] ?? "");

        Get.offNamed("/home");
        Get.snackbar("Success", "Logged in successfully");
      } else {
        Get.snackbar(
          "Error",
          responseBody['message'] ?? "Invalid email/phone or password",
        );
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred during login: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
