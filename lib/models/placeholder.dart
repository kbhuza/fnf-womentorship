class EventModel {
  final String id;
  final String name;
  final String description;
  final List<String> administrators;
  final List<String> mentors;
  final List<String> mentees;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.administrators,
    required this.mentors,
    required this.mentees,
  });
}

class FeedbackModel {
  final String eventId;
  final String userId;
  final String role;
  final String comments;
  final String improvements;
  final double overallRating;

  FeedbackModel({
    required this.eventId,
    required this.userId,
    required this.role,
    required this.comments,
    required this.improvements,
    required this.overallRating,
  });
}