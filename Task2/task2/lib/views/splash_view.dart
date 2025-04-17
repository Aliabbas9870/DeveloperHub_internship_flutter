import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.flutter_dash, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'Welcome to DeveloperHub Task2',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Best Learning Experience',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
