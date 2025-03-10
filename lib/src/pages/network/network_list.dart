import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkController extends GetxController {
  var users = <UserModel>[
    UserModel(
      name: "Sophia",
      surname: "Johnson",
      role: "Mentor",
      bio: "Dedicated to empowering women in technology and innovation.",
      profileUrl: "https://randomuser.me/api/portraits/women/1.jpg",
      hashtags: ["#womenintech", "#empowerment", "#innovation"],
      achievements: ["Tech Mentor of the Year 2023", "Women in STEM Advocate"],
    ),
    UserModel(
      name: "Emma",
      surname: "Williams",
      role: "Mentee",
      bio: "Aspiring data scientist with a passion for machine learning.",
      profileUrl: "https://randomuser.me/api/portraits/women/2.jpg",
      hashtags: ["#datascience", "#machinelearning", "#growth"],
      achievements: [
        "Completed Data Science Bootcamp",
        "Published Research Paper"
      ],
    ),
    UserModel(
      name: "Olivia",
      surname: "Brown",
      role: "Administrator",
      bio: "Managing community outreach programs for young women in tech.",
      profileUrl: "https://randomuser.me/api/portraits/women/3.jpg",
      hashtags: ["#community", "#outreach", "#leadership"],
      achievements: [
        "Organizer of Tech for Good 2024",
        "Community Leader Award"
      ],
    ),
    UserModel(
      name: "Ava",
      surname: "Davis",
      role: "Mentor",
      bio:
          "Passionate about coding and teaching the next generation of developers.",
      profileUrl: "https://randomuser.me/api/portraits/women/4.jpg",
      hashtags: ["#coding", "#education", "#mentorship"],
      achievements: ["Top Coding Instructor 2023", "Women Who Code Member"],
    ),
    UserModel(
      name: "Isabella",
      surname: "Garcia",
      role: "Mentee",
      bio: "Learning web development and eager to create impactful projects.",
      profileUrl: "https://randomuser.me/api/portraits/women/5.jpg",
      hashtags: ["#webdevelopment", "#learning", "#projects"],
      achievements: [
        "Completed Frontend Development Course",
        "Hackathon Winner"
      ],
    ),
    UserModel(
      name: "Mia",
      surname: "Martinez",
      role: "Administrator",
      bio: "Coordinating events to inspire young women in tech careers.",
      profileUrl: "https://randomuser.me/api/portraits/women/6.jpg",
      hashtags: ["#events", "#inspiration", "#womenintech"],
      achievements: [
        "Event Coordinator of the Year 2023",
        "Tech Conference Speaker"
      ],
    ),
  ].obs;
}

class UserModel {
  final String name;
  final String surname;
  final String role;
  final String bio;
  final String profileUrl;
  final List<String> hashtags;
  final List<String> achievements;

  UserModel({
    required this.name,
    required this.surname,
    required this.role,
    required this.bio,
    required this.profileUrl,
    required this.hashtags,
    required this.achievements,
  });
}

class NetworkPage extends StatelessWidget {
  final NetworkController controller = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Network")),
      body: Obx(() => ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              String proxyUrl =
                  'http://localhost:3000/proxy/${Uri.encodeComponent(user.profileUrl)}';
              return GestureDetector(
                onTap: () {
                  Get.to(UserDetailsPage(user: user));
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[300],
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: proxyUrl,
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${user.name} ${user.surname}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    user.role,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 109, 102, 102)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                user.bio,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 101, 100, 100)),
                              ),
                              SizedBox(height: 6),
                              Wrap(
                                spacing: 6,
                                children: user.hashtags.map((tag) {
                                  return Chip(
                                    label: Text(tag,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                    backgroundColor:
                                        const Color.fromARGB(255, 207, 45, 99),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final UserModel user;

  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.profileUrl),
                ),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.name} ${user.surname}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.role,
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 109, 102, 102)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.bio,
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 101, 100, 100)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Hashtags",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Wrap(
                    spacing: 6,
                    children: user.hashtags.map((tag) {
                      return Chip(
                        label: Text(tag,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        backgroundColor: const Color.fromARGB(255, 207, 45, 99),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Achievements",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ...user.achievements.map((achievement) {
                    return ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text(achievement),
                    );
                  }).toList(),
                  SizedBox(height: 20),
                  // LinkedIn Connect Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Replace with the user's LinkedIn profile URL
                      final linkedInUrl =
                          "https://www.linkedin.com/in/${user.name.toLowerCase()}-${user.surname.toLowerCase()}";
                      // Open the LinkedIn profile in a web browser
                      launchURL(linkedInUrl);
                    },
                    icon: SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/0/01/LinkedIn_Logo.svg',
                      height: 24,
                      width: 24,
                      placeholderBuilder: (context) => Container(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    label: Text("Connect"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF0077B5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    // Use url_launcher package to open the URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
