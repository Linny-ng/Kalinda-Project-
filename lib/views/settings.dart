import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
        backgroundColor: primaryColour,
        foregroundColor: secondaryColour,
        actions: [],
      ),
      body: Center(
        child: Card(
          elevation: 4,
          child: Container(
            width: 350,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Account"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Privacy"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.brown),
                  title: Text("Logout", style: TextStyle(color: Colors.brown)),
                  onTap: () {
                    store.erase();
                    Get.offAllNamed("/");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
