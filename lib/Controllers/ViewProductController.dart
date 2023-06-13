import 'package:ecommerceapp/Models/ViewProductModel.dart';
import 'package:get/get.dart';

class ViewProductController extends GetxController{
  final List cartItems=[];


  addItemInCart(ViewProductsModel products) {
    cartItems.add(products);
    update();
  }

}