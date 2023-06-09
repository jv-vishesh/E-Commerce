import 'package:ecommerceapp/Controllers/HomePageController.dart';
import 'package:get/get.dart';


class HomepageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
  
}