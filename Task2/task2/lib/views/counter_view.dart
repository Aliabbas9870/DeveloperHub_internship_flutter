import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/controller/counter_controller.dart';
import 'package:task2/views/todo_view.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter"),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "${controller.counter}",
              style: TextStyle(fontSize: 69),
              textAlign: TextAlign.center,
            )), // reactive value shown

            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: IconButton(
                    onPressed: () {
                      controller.inc();
                    },
                    icon: Icon(Icons.add),
                  ),
                ),

                SizedBox(
                  width: 50,
                ),
                // reactive value shown
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    onPressed: () {
                      controller.dec();
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => TodoView(),
                      transition: Transition.leftToRightWithFade,
                      duration: Duration(seconds: 2));
                },
                child: Text(
                  "Todo ",
                  style: TextStyle(fontSize: 21),
                ))
          ],
        ),
      ),
    );
  }
}
