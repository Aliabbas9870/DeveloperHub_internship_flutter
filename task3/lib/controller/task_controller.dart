import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/model/task_model.dart';
import 'package:task3/service/data_store_service.dart';

class TaskController extends GetxController {
  var taskList = <TaskModel>[].obs;
  final StorageService _storageService = StorageService();

  @override
  void onInit() {
    loadTasks();
    super.onInit();
  }

  void loadTasks() async {
    taskList.value = await _storageService.loadTasks();
  }

  void addTask(String task) {
    taskList.add(TaskModel(title: task));
    _storageService.saveTasks(taskList);
    Get.snackbar(
      'Task Added',
      'Task has been added successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Navigator.pop;
  }

  void toggleDone(int index) {
    taskList[index].isDone = !taskList[index].isDone;
    taskList.refresh(); // Needed to update UI
    _storageService.saveTasks(taskList);
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    Get.snackbar(
      'Task Deleted',
      'Task has been deleted successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
