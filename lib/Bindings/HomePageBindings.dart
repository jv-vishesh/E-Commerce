import 'package:ecommerceapp/Controllers/HomePageController.dart';
import 'package:get/get.dart';

import '../Controllers/bottom_navigation_bar_controller.dart';

class HomepageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController(),fenix: true);
    Get.lazyPut(() => HomePageController());
  }
  
}