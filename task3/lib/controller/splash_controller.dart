import 'dart:async';

import 'package:get/get.dart';
import 'package:task3/views/home_view.dart';

class SplashController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () {
      Get.off(()=>  HomeView(),
          transition: Transition.leftToRightWithFade,
          duration: Duration(seconds: 3));
    });
  }
}
