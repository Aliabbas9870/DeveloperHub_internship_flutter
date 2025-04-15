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
        title: Text(email),
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
