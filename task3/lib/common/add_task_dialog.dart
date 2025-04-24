// views/add_task_dialog.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/controller/task_controller.dart';

class AddTaskDialog extends StatelessWidget {
  final controller = TextEditingController();
  final TaskController taskController = Get.find();
  Dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Task"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Enter task title"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              taskController.addTask(controller.text.trim());
              Get.back();
            }
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
