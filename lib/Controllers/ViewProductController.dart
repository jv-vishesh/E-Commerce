import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Models/addToCartModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ViewProductController extends GetxController{
  final List cartItems=[];


  addItemInCart(AddtocartProducts products) {
    cartItems.add(products);
    update();
  }

}