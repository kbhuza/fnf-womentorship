import 'package:fnf_womentorship/models/placeholder.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var events = <EventModel>[
    EventModel(
      id: "1",
      name: "FNF SheJourno Cohort 1",
      description: "Kickoff event for Cohort 1",
      administrators: ["Nakila", "Emina"],
      mentors: ["Bridget", "Zahra"],
      mentees: ["Eliza", "Buhle"],
    ),
    EventModel(
      id: "2",
      name: "Workshop on AI in Media",
      description: "Workshop on AI in media and propaganda development",
      administrators: ["Numi", "Pakilaa"],
      mentors: ["Feli", "Sarah"],
      mentees: ["Nandi", "Melissa"],
    ),
  ].obs;

  var selectedEvent = "".obs;
  var selectedRole = "".obs;
  var selectedUser = "".obs;
  var feedbackComments = "".obs;
  var feedbackImprovements = "".obs;
  var feedbackOverallRating = 0.0.obs;

  void selectEvent(String id) {
    selectedEvent.value = id;
  }

  void selectRole(String role) {
    selectedRole.value = role;
  }

  void selectUser(String user) {
    selectedUser.value = user;
  }

  void submitFeedback(String userId, String role) {
    final feedback = FeedbackModel(
      eventId: selectedEvent.value,
      userId: userId,
      role: role,
      comments: feedbackComments.value,
      improvements: feedbackImprovements.value,
      overallRating: feedbackOverallRating.value,
    );
    // Save feedback to your data store (e.g., database)
    print("Feedback submitted: $feedback");
  }
}
