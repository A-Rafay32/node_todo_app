import 'package:node_todo_app/models/tasks.dart';
import 'package:provider/provider.dart';

class Notes {
  String? id;
  String userId;
  String title;
  String description;
  List<Task> tasks;
  String? createdAt;
  String? updatedAt;

  Notes({
    required this.userId,
    this.id,
    this.title = "Untitled Note",
    this.description = "",
    this.tasks = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory Notes.fromJson(Map json) {
    return Notes(
      id: json["_id"],
      userId: json['userId'],
      title: json['title'] ?? "Untitled Note",
      description: json['description'] ?? "",
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((taskJson) => Task.fromJson(taskJson))
              .toList() ??
          [],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
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
