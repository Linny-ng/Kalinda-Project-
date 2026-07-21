import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Profile"),
        backgroundColor: secondaryColour,
        foregroundColor: const Color.fromARGB(255, 250, 247, 245),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/settings");
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: secondaryColour,
                child: Icon(Icons.person, size: 70, color: Colors.white),
              ),

              const SizedBox(height: 20),

              const Text(
                "Brian Kalinda",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Youth Member",
                style: TextStyle(fontSize: 16, color: secondaryColour),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 4,
                child: SizedBox(
                  width: 500, // good for Flutter Web
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.email,
                            color: primaryColour,
                          ),
                          title: const Text("Email"),
                          subtitle: const Text("brian@example.com"),
                        ),

                        ListTile(
                          leading: const Icon(
                            Icons.phone,
                            color: primaryColour,
                          ),
                          title: const Text("Phone"),
                          subtitle: const Text("+254 700 000 000"),
                        ),

                        ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            color: primaryColour,
                          ),
                          title: const Text("Location"),
                          subtitle: const Text("Machakos, Kenya"),
                        ),

                        ListTile(
                          leading: const Icon(
                            Icons.school,
                            color: primaryColour,
                          ),
                          title: const Text("Education"),
                          subtitle: const Text("Computer Science"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
