import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Controllers/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class SignInPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => BottomNavigationBarController());
  }
}