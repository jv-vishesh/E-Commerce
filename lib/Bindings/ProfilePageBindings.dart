import 'package:ecommerceapp/Controllers/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class ProfilePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
  }
}