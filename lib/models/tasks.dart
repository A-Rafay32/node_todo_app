import 'package:node_todo_app/models/task_category.dart';

class Task {
  String title;
  int priority;
  bool status;
  TaskCategory category;

  Task({
    required this.title,
    this.priority = 1,
    this.status = false,
    required this.category,
  });

  factory Task.fromJson(Map json) {
    return Task(
      title: json['title'],
      priority: json['priority'] ?? 1,
      status: json['status'] ?? false,
      category: TaskCategory.toCategory(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'priority': priority,
      'status': status,
      'category': category.name.toString(),
    };
  }
}
