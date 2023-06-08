import 'package:ecommerceapp/Controllers/HomePageController.dart';
import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Controllers/SignUpController.dart';
import 'package:get/get.dart';

import '../Controllers/bottom_navigation_bar_controller.dart';

class HomepageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
  
}