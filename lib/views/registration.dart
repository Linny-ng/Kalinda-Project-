import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

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
        backgroundColor: secondaryColour,
        foregroundColor: const Color.fromARGB(255, 250, 247, 245),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),

          IconButton(onPressed: () {}, icon: Icon(Icons.login)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 35)),
              Text("Sign Up to continue", style: TextStyle(fontSize: 10)),
              SizedBox(height: 40),
              Text(
                "Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: primaryColour,
                    hoverColor: secondaryColour,
                    hoverElevation: 10.0,
                    highlightElevation: 20.0,
                    height: 45,
                    child: const Text("SignUp"),
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
    );
  }
}
