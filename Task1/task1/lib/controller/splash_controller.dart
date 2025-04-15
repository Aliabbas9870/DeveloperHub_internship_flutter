import 'dart:async';

import 'package:get/get.dart';
import 'package:task1/views/auth/login_auth.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const LoginAuth() ,transition: Transition.fadeIn,); 
    });
  }
}
