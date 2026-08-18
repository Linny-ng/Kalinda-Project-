import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
      initialRoute: "/",
      getPages: routes,
    );
  }
}
