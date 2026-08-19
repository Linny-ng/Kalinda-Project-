import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Mymentorshipprogram extends StatefulWidget {
  const Mymentorshipprogram({super.key});

  @override
  State<Mymentorshipprogram> createState() => _MymentorshipprogramState();
}

class _MymentorshipprogramState extends State<Mymentorshipprogram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentorship Program"),
        elevation: 0,
        backgroundColor: primaryColour,
        foregroundColor: secondaryColour,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: primaryColour.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.handshake_outlined,
                    size: 50,
                    color: primaryColour,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Accelerate Your Growth",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColour,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Connect 1-on-1 with industry experts to guide your journey.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryColour),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Category Chips
            Text(
              "Browse Topics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,

              children: [
                Chip(
                  label: Text("Leadership Skills"),
                  avatar: Icon(Icons.chair, size: 18, color: primaryColour),
                ),
                Chip(
                  label: Text("Art & Design"),
                  avatar: Icon(Icons.palette, size: 18, color: primaryColour),
                ),
                Chip(
                  label: Text("Career Advice"),
                  avatar: Icon(Icons.work, size: 18, color: primaryColour),
                ),
                Chip(
                  label: Text("Entrepreneurship"),
                  avatar: Icon(
                    Icons.business_center,
                    size: 18,
                    color: primaryColour,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Recommended Mentors
            Text(
              "Top Mentors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColour.withValues(alpha: 0.1),
                  child: Text("LN", style: TextStyle(color: primaryColour)),
                ),
                title: Text(
                  "Linny Ng'ethe",
                  style: TextStyle(color: primaryColour),
                ),
                subtitle: Text(
                  "CEO • Lunar Classics",
                  style: TextStyle(color: primaryColour),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Connect",
                    style: TextStyle(color: primaryColour),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColour.withValues(alpha: 0.1),
                  child: Text("DW", style: TextStyle(color: primaryColour)),
                ),
                title: Text(
                  "Daphine Wambui",
                  style: TextStyle(color: primaryColour),
                ),
                subtitle: Text(
                  "Entrepreneur • Bobby Corp",
                  style: TextStyle(color: primaryColour),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Connect",
                    style: TextStyle(color: primaryColour),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Find a mentor action
                },
                child: Text(
                  "Find a Mentor",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColour,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Apply as mentor action
                },
                child: Text(
                  "Become a Mentor",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColour,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
