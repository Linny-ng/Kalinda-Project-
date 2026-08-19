import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColour.withValues(alpha: 0.05),
      appBar: AppBar(
        title: Text(
          "Youth Community",
          style: TextStyle(color: secondaryColour, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColour,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: primaryColour,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.groups, size: 36, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        "Community Hub",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColour,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Connect, share and grow with other youth members.",
                    style: TextStyle(color: secondaryColour, fontSize: 14),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(Icons.person, color: primaryColour),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Share an update or question...",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: primaryColour),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Feed Header
            Text(
              "Recent Posts",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 12),

            Card(
              color: Colors.white,
              elevation: 1,
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: primaryColour.withValues(alpha: 0.1),
                        child: Text(
                          "SN",
                          style: TextStyle(
                            color: primaryColour,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        "Stephen Njehia",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text("2 hours ago"),
                    ),
                    Text(
                      "Thank you for such an opportunity. I came to grow, and I did. I am grateful for the mentorship program and the amazing mentors.",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: primaryColour,
                        ),
                        SizedBox(width: 4),
                        Text("12"),
                        SizedBox(width: 20),
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 20,
                          color: primaryColour,
                        ),
                        SizedBox(width: 4),
                        Text("4"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.white,
              elevation: 1,
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: primaryColour.withValues(alpha: 0.1),
                        child: Text(
                          "KK",
                          style: TextStyle(
                            color: primaryColour,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        "Karen Kiplagat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text("5 hours ago"),
                    ),
                    Text(
                      "Does anyone have good resource recommendations for building a personal brand online? Would love to hear your thoughts!",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: primaryColour,
                        ),
                        SizedBox(width: 4),
                        Text("8"),
                        SizedBox(width: 20),
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 20,
                          color: primaryColour,
                        ),
                        SizedBox(width: 4),
                        Text("9"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Post 3 - Nikki Kiplagat
            Card(
              color: Colors.white,
              elevation: 1,
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: primaryColour.withValues(alpha: 0.1),
                        child: Text(
                          "NK",
                          style: TextStyle(
                            color: primaryColour,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        "Nicole Kiplagat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text("Yesterday"),
                    ),
                    Text(
                      "Great session with my mentor today! Highly encourage everyone to join the mentorship program.",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: primaryColour,
                        ),
                        SizedBox(width: 4),
                        Text("24"),
                        SizedBox(width: 20),
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 20,
                          color: primaryColour,
                        ),
                        SizedBox(width: 4),
                        Text("6"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColour,
        foregroundColor: secondaryColour,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
