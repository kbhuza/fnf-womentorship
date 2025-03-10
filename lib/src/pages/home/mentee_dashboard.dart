import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';

class MenteeDashboardScreen extends StatelessWidget {
    static const String routeName = "/mentee-dashboard";

  const MenteeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mentee Dashboard"),
        // Optionally include a leading logo or a custom widget
        // leading: Image.asset("assets/images/womentorship_logo.png"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 1. Greeting & Basic Info
              _buildGreetingSection(),

              const SizedBox(height: 24.0),

              // 2. Feed Section
              _buildFeedSection(context),

              const SizedBox(height: 12.0),

              // 3. Progress Tracking
              _buildProgressTracking(),

              const SizedBox(height: 24.0),

              // 4. Timeline Visualization
              _buildTimelineSection(),

              const SizedBox(height: 24.0),

              // 5. Achievement Badges
              _buildAchievementBadges(),

              const SizedBox(height: 24.0),

              // 6. Feedback Forms
              _buildFeedbackForms(context),

              const SizedBox(height: 24.0),

              // 7. Meeting Notes
              _buildMeetingNotes(context),

            ],
          ),
        ),
      ),
      // Optionally add a bottom navigation bar for other main sections
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildGreetingSection() {
    return Row(
      children: [
        // Profile Avatar
        CircleAvatar(
          radius: 30,
          child: SvgPicture.asset(
    'assets/svgs/placeholder.svg',
    color:  Colors.grey,
    height: 30,
    width: 30,
  ),
          // or NetworkImage(...) if loading from server
        ),
        const SizedBox(width: 16.0),
        // Greeting Text
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Tanaka!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome back to Womentorship!",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeedSection(BuildContext context) {
    // Example feed items
    final feedItems = [
      "Don’t forget the upcoming workshop on investigative journalism!",
      "Your mentor has shared a new article: 'Media Ethics 101'.",
      "New badge earned: 'Active Participant'!",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Feed",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8.0),
        // Display feed items in a ListView.builder or Column
        Column(
          children: feedItems.map((item) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: Text(item),
                onTap: () {
                  // Navigate to a detail page or handle the feed item
                },
              ),
            );
          }).toList(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Navigate to a "View All" feed screen
            },
            child: const Text("View All"),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressTracking() {
    // Example progress data
    double progressValue = 0.3; // 30% completed
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Progress",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        // A simple linear progress indicator
        LinearProgressIndicator(
          value: progressValue,
          minHeight: 8.0,
          backgroundColor: Colors.grey[300],
          valueColor: const  AlwaysStoppedAnimation<Color>(secondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(height: 8.0),
        const Text("You’ve completed 3 of 10 modules (30%)"),
      ],
    );
  }

  Widget _buildTimelineSection() {
    // This is a placeholder for a timeline or stepper widget.
    // Flutter doesn’t have a built-in timeline, but you can use
    // a package like 'timelines' or create a custom stepper.

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Timeline",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        // For illustration, a basic list that simulates timeline steps
        Column(
          children: [
            _buildTimelineStep("Registered for Womentorship", "Jan 15"),
            _buildTimelineStep("Completed Module 1: Basics", "Jan 20"),
            _buildTimelineStep("Attended Workshop on Interview Skills", "Feb 10"),
            // ... more steps
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineStep(String title, String date) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot or icon
        Container(
          margin: const EdgeInsets.only(right: 8.0, top: 6.0),
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryColor,
          ),
        ),
        // Step details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(date, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementBadges() {
    // Example badges
    final badges = [
      {"name": "Starter", "icon": Icons.star},
      {"name": "Writer", "icon": Icons.edit},
      {"name": "Collaborator", "icon": Icons.group},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Achievement Badges",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 60, // Adjust as needed
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: badges.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
            itemBuilder: (context, index) {
              final badge = badges[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(
                      badge["icon"] as IconData,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    badge["name"] as String,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackForms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Feedback",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Card(
          color: Colors.pink.shade50,
          child: ListTile(
            title: const Text("Share Your Feedback"),
            subtitle: const Text("Help us improve your experience."),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to feedback form screen
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMeetingNotes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Meeting Notes",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        // Example of a single note snippet
        Card(
          child: ListTile(
            title: const Text("Mentor Meeting - 05 March 2025"),
            subtitle: const Text(
              "• Discussed progress on Module 3\n"
              "• Set goals for the next two weeks\n"
              "• Next meeting scheduled for 12 March",
            ),
            onTap: () {
              // Navigate to a detailed notes screen
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Navigate to a "View All Notes" screen
            },
            child: const Text("View All Notes"),
          ),
        ),
      ],
    );
  }
}
