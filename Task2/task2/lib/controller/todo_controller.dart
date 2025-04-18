import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/model/todo_model.dart';

class TodoController extends GetxController {
  RxList<TodoModel> _task = <TodoModel>[].obs;

  List<TodoModel> get tasks => _task;
  TextEditingController titleController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController taskNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadTasks(); // Load saved tasks when controller starts
  }


 void addTodo() async {
    
   
   _task.add(TodoModel(title: titleController.text, date: endDateController.text, tasknumber: taskNumberController.text));
    await saveTasks();
    Get.snackbar("Added", "Task Added Successfully",backgroundColor: Colors.greenAccent);
  }


  void delete(int index) async {
    _task.removeAt(index);
    await saveTasks();
    Get.snackbar("Removed", "Task Removed Successfully",backgroundColor: Colors.redAccent);
  }

Future<void> saveTasks() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  List<String> stringList = _task.map((e) => jsonEncode(e.toJson())).toList();
  await sp.setStringList('tasks', stringList);
}

Future<void> loadTasks() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  List<String> stringList = sp.getStringList('tasks') ?? [];

  _task.value = stringList
      .map((item) => TodoModel.fromJson(jsonDecode(item)))
      .toList();
}

}
