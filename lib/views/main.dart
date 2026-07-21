import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/routes.dart';
// ignore: unused_import
import 'package:flutter_application_1/views/home.dart';
// ignore: unused_import
import 'package:flutter_application_1/views/login.dart';
// ignore: unused_import
import 'package:flutter_application_1/views/profile.dart';
// ignore: unused_import
import 'package:flutter_application_1/views/registration.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(Kalinda());
}

class Kalinda extends StatefulWidget {
  const Kalinda({super.key});

  @override
  State<Kalinda> createState() => _KalindaState();
}

class _KalindaState extends State<Kalinda> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
