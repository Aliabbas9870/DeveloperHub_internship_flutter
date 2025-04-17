import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt _counter = 0.obs;
  int get counter => _counter.value;
  void inc() {
    _counter++;
  }

  void dec() {
    if (_counter> 0) {
      _counter--;
    
      return;
    }
  }
}
