import 'package:ecommerceapp/Controllers/MyBagController.dart';
import 'package:get/get.dart';

class MyBagBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyBagController());
  }

}