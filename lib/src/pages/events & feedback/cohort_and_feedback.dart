import 'package:flutter/material.dart';
import 'package:fnf_womentorship/controllers/cohort_and_feedback_controller.dart';
import 'package:fnf_womentorship/models/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EventManagementPage extends StatelessWidget {
  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Management"),
        backgroundColor: Colors.pinkAccent, // Deep pink color for the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Event Dropdown
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.selectedEvent.value.isNotEmpty
                    ? controller.selectedEvent.value
                    : null,
                onChanged: (value) {
                  controller.selectEvent(value!);
                },
                items: controller.events.map((event) {
                  return DropdownMenuItem<String>(
                    value: event.id,
                    child: Text(event.name),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Select Event",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50], // Light blue background
                ),
              ),
            ),
            SizedBox(height: 20),

            // Search Field
            TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.blue[50], // Light blue background
                suffixIcon: Icon(Icons.search, color: Colors.pinkAccent),
              ),
            ),
            SizedBox(height: 20),

            // List of Roles
            Obx(
              () => controller.selectedEvent.value.isNotEmpty
                  ? Column(
                      children: [
                        Text("Select Role",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold)),
                        DropdownButtonFormField<String>(
                          value: controller.selectedRole.value.isNotEmpty
                              ? controller.selectedRole.value
                              : null,
                          onChanged: (value) {
                            controller.selectRole(value!);
                          },
                          items:
                              ["Administrator", "Mentor", "Mentee"].map((role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: "Select Role",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.blue[50], // Light blue background
                          ),
                        ),
                        SizedBox(height: 20),

                        // List of Users for Selected Role
                        Obx(
                          () => controller.selectedRole.value.isNotEmpty
                              ? Column(
                                  children: [
                                    Text("Select Participant",
                                        style: TextStyle(
                                            color: Colors.pinkAccent,
                                            fontWeight: FontWeight.bold)),
                                    DropdownButtonFormField<String>(
                                      value: controller
                                              .selectedUser.value.isNotEmpty
                                          ? controller.selectedUser.value
                                          : null,
                                      onChanged: (value) {
                                        controller.selectUser(value!);
                                      },
                                      items: controller.events
                                          .firstWhere((event) =>
                                              event.id ==
                                              controller.selectedEvent.value)
                                          .getUsersForRole(
                                              controller.selectedRole.value)
                                          .map((user) {
                                        return DropdownMenuItem<String>(
                                          value: user,
                                          child: Text(user),
                                        );
                                      }).toList(),
                                      decoration: InputDecoration(
                                        labelText: "Select User",
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors
                                            .blue[50], // Light blue background
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    // Feedback Form
                                    controller.selectedUser.value.isNotEmpty
                                        ? Column(
                                            children: [
                                              Text(
                                                  "Feedback for ${controller.selectedUser.value}",
                                                  style: TextStyle(
                                                      color: Colors.pinkAccent,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: controller
                                                            .feedbackComments
                                                            .value),
                                                onChanged: (value) {
                                                  controller.feedbackComments
                                                      .value = value;
                                                },
                                                decoration: InputDecoration(
                                                  labelText: "Comments",
                                                  border: OutlineInputBorder(),
                                                  filled: true,
                                                  fillColor: Colors.blue[
                                                      50], // Light blue background
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: controller
                                                            .feedbackImprovements
                                                            .value),
                                                onChanged: (value) {
                                                  controller
                                                      .feedbackImprovements
                                                      .value = value;
                                                },
                                                decoration: InputDecoration(
                                                  labelText: "Improvements",
                                                  border: OutlineInputBorder(),
                                                  filled: true,
                                                  fillColor: Colors.blue[
                                                      50], // Light blue background
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              RatingBar.builder(
                                                initialRating: controller
                                                    .feedbackOverallRating
                                                    .value,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 30,
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  controller
                                                      .feedbackOverallRating
                                                      .value = rating;
                                                },
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: () {
                                                  controller.submitFeedback(
                                                      controller
                                                          .selectedUser.value,
                                                      controller
                                                          .selectedRole.value);
                                                },
                                                child: Text("Submit Feedback"),
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.white, backgroundColor: Colors
                                                      .pinkAccent,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 20),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                )
                              : Container(),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

extension EventModelExtension on EventModel {
  List<String> getUsersForRole(String role) {
    switch (role) {
      case "Administrator":
        return administrators;
      case "Mentor":
        return mentors;
      case "Mentee":
        return mentees;
      default:
        return [];
    }
  }
}
