import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/views/home_view.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();

   if (email.isEmpty || password.isEmpty || name.isEmpty) {
  Get.snackbar("Error", "Please fill all fields",
      colorText: Colors.white,
      icon: Icon(Icons.error),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red);
} else if (!GetUtils.isEmail(email)) {
  Get.snackbar("Error", "Please enter a valid email",
      colorText: Colors.white,
      icon: Icon(Icons.error),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red);
} else if (password.length < 6) {
  Get.snackbar("Error", "Password must be at least 6 characters",
      colorText: Colors.white,
      icon: Icon(Icons.error),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red);
}

   
    else {
      Get.snackbar("Login", "Logged in as $email",
          icon: Icon(Icons.done_outline_outlined),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.greenAccent);

      Get.off(HomeView(),
          duration: Duration(seconds: 2),
          transition: Transition.circularReveal,
          arguments: [name.toString(), email.toString()]);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
