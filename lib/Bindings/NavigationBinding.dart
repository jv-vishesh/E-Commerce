import 'package:ecommerceapp/Controllers/HomePageController.dart';
import 'package:ecommerceapp/Controllers/MyBagController.dart';
import 'package:ecommerceapp/Controllers/ProfilePageController.dart';
import 'package:ecommerceapp/Controllers/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';
import '../Controllers/AddProductController.dart';

class NavigationBarBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => BottomNavigationBarController(),fenix: true);
    Get.lazyPut(() => HomePageController(),fenix: true);
    Get.lazyPut(()=> AddProductController());
    Get.lazyPut(() => ProfilePageController());
    Get.lazyPut(() => MyBagController(),fenix: true);
  }
}