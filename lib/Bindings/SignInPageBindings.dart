import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:get/get.dart';

class SignInPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}