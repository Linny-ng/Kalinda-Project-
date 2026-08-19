import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
// ignore: unused_import
import 'package:flutter_application_1/views/login.dart';
// ignore: unused_import
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

bool registering = false;

TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController phonenumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController professionController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("kalinda youth"),
        backgroundColor: primaryColour,
        foregroundColor: secondaryColour,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),

          IconButton(onPressed: () {}, icon: Icon(Icons.login)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sign Up", style: TextStyle(fontSize: 35)),
                Text("Sign Up to continue", style: TextStyle(fontSize: 10)),
                SizedBox(height: 40),
                Text(
                  "Firstname",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: firstnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Lastname",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: lastnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Phonenumber",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: phonenumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Profession",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: professionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "confirm password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        if (firstnameController.text.isEmpty ||
                            lastnameController.text.isEmpty ||
                            phonenumberController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty) {
                          Get.snackbar("Error", "Please fill all the fields");
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          Get.snackbar(
                            "Error",
                            "Password and Confirm Password do not match",
                          );
                        } else {
                          setState(() {
                            registering = true;
                          });

                          var response = await http.post(
                            Uri.parse(
                              "http://localhost/kalindayouth/create_user.php",
                            ),
                            body: {
                              "firstname": firstnameController.text,
                              "lastname": lastnameController.text,
                              "phonenumber": phonenumberController.text,
                              "email": emailController.text,
                              "password": passwordController.text,
                              "confirm_password":
                                  confirmPasswordController.text,
                            },
                          );
                          setState(() {
                            registering = false;
                          });
                          var serverResponse = jsonDecode(response.body);
                          if (serverResponse['success'] == 1) {
                            Get.snackbar(
                              "Success",
                              "User registered successfuly",
                            );
                            Get.toNamed("/login");
                          } else {
                            Get.snackbar("Error", "Failed to register user");
                          }
                        }
                      },
                      color: primaryColour,
                      hoverColor: secondaryColour,
                      hoverElevation: 10.0,
                      highlightElevation: 20.0,
                      height: 45,
                      child: registering
                          ? CircularProgressIndicator()
                          : Text("SignUp"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "If signed up? Log In",
                  style: TextStyle(color: primaryColour),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
