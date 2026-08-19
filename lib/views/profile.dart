import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
  String firstName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String location = "";
  String education = "";
  String roleTitle = "";
  String profilePicture = "";

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    // Reads stored ID or falls back to '1' for testing
    String userId = store.read("user_id")?.toString() ?? "1";

    var url = Uri.parse("http://localhost/kalindayouth/get_profile.php");

    try {
      var response = await http.post(url, body: {"user_id": userId});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['success'] == 1 && data['user'] != null) {
          var user = data['user'];
          setState(() {
            firstName = user['firstname'] ?? "";
            lastName = user['lastname'] ?? "";
            email = user['email'] ?? "";
            phone = user['phonenumber'] ?? "";
            location = user['location'] ?? "Machakos, Kenya";
            education = user['education'] ?? "Computer Science";
            roleTitle = user['role_title'] ?? "Youth Member";
            profilePicture = user['picture'] ?? "";
            isLoading = false;
          });
        } else {
          Get.snackbar("Notice", data['message'] ?? "User data not found");
          setState(() => isLoading = false);
        }
      } else {
        Get.snackbar("Error", "Server error (${response.statusCode})");
        setState(() => isLoading = false);
      }
    } catch (e) {
      Get.snackbar("Connection Error", "Could not reach server: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColour,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Profile"),
        backgroundColor: primaryColour,
        foregroundColor: secondaryColour,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed("/settings"),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: primaryColour))
          : Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: profilePicture.isNotEmpty
                          ? NetworkImage(
                              "http://localhost/kalindayouth/profile_pictures/$profilePicture",
                            )
                          : null,
                      radius: 60,
                      backgroundColor: primaryColour,
                      child: profilePicture.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            )
                          : null,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "$firstName $lastName".trim().isNotEmpty
                          ? "$firstName $lastName"
                          : "User Name",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      roleTitle,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),

                    const SizedBox(height: 30),

                    Card(
                      elevation: 4,
                      child: SizedBox(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.email,
                                  color: primaryColour,
                                ),
                                title: const Text("Email"),
                                subtitle: Text(
                                  email.isNotEmpty ? email : "N/A",
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.phone,
                                  color: primaryColour,
                                ),
                                title: const Text("Phone"),
                                subtitle: Text(
                                  phone.isNotEmpty ? phone : "N/A",
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  color: primaryColour,
                                ),
                                title: const Text("Location"),
                                subtitle: Text(
                                  location.isNotEmpty ? location : "N/A",
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.school,
                                  color: primaryColour,
                                ),
                                title: const Text("Education"),
                                subtitle: Text(
                                  education.isNotEmpty ? education : "N/A",
                                ),
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
