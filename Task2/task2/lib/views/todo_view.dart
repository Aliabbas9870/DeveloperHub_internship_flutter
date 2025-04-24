import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/controller/todo_controller.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final td = Get.put(TodoController());

    void _showTaskDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Add Task"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: td.titleController,
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    controller: td.endDateController,
                    decoration: InputDecoration(labelText: "End Date"),
                  ),
                  TextField(
                    controller: td.taskNumberController,
                    decoration: InputDecoration(labelText: "Task Number"),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text("Add"),
                onPressed: () {
                  td.addTodo();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo"),
      ),
      body: Obx(() => ListView.builder(
            itemCount: td.tasks.length,
            itemBuilder: (context, index) {
       

              return Dismissible(
  key: Key(td.tasks[index].toString()),
  direction: DismissDirection.down,
  background: Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.red,
    child: Icon(Icons.delete, color: Colors.white),
  ),
  onDismissed: (direction) {
    td.delete(index);
  },
  child: Card(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: ListTile(
      title: Text(td.tasks[index].title),
      subtitle: Text(td.tasks[index].date),
      leading: CircleAvatar(
        child: Text(td.tasks[index].tasknumber),
      ),
      trailing: AnimatedSwitcher(
        duration: Duration(seconds: 5),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: IconButton(
          key: ValueKey(td.tasks[index]),
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            td.delete(index);
          },
        ),
      ),
    ),
  ),
);

            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
