// models/task_model.dart
class TaskModel {
  String title;
  bool isDone;

  TaskModel({required this.title, this.isDone = false});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json['title'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };
}
