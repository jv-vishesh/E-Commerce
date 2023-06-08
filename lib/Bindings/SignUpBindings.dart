import 'package:ecommerceapp/Controllers/SignUpController.dart';
import 'package:get/get.dart';
import '../Controllers/AddProductController.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(),fenix: true);
  }

}