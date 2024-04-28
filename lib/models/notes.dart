import 'package:node_todo_app/models/tasks.dart';

class Notes {
  String userId;
  String title;
  String description;
  List<Task> tasks;

  Notes({
    required this.userId,
    this.title = "Untitled Note",
    this.description = "",
    this.tasks = const [], // Assuming the tasks array can be empty
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      userId: json['userId'],
      title: json['title'] ?? "Untitled Note",
      description: json['description'] ?? "",
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((taskJson) => Task.fromJson(taskJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }
}
