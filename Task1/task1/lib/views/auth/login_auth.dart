import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/controller/auth_controller.dart';

class LoginAuth extends StatelessWidget {
  const LoginAuth({super.key});
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginController.nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: loginController.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: loginController.passwordController,
              decoration: const InputDecoration(
                
                  prefixIcon: Icon(Icons.password), labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginController.loginUser,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
