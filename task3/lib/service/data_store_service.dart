// services/storage_service.dart
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/model/task_model.dart';



class StorageService {
  static const String key = 'tasks';

  Future<List<TaskModel>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(key);
    if (tasksJson == null) return [];
    final List<dynamic> decoded = json.decode(tasksJson);
    return decoded.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = json.encode(tasks.map((t) => t.toJson()).toList());
    await prefs.setString(key, encoded);
  }
}
