// views/home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/common/add_task_dialog.dart';

import '../controller/task_controller.dart';

class HomeView extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Manager"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AddTaskDialog(),
            ),
          )
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.taskList.length,
            itemBuilder: (_, index) {
              final task = controller.taskList[index];
              return ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (_) => controller.toggleDone(index),
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteTask(index),
                ),
              );
            },
          )),
    );
  }
}
