import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // final String email = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> args = Get.arguments;

    final String name = args[0];

    final String email = args[1];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(), title: Text(name,style: TextStyle(color: Colors.white),),
            subtitle: Text(email,style: TextStyle(color: Colors.white),)),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text(email),
            title: Text(name),
          ),
          Center(
            child: Text("Welcome On The App Task one $name"),
          )
        ],
      ),
    );
  }
}
