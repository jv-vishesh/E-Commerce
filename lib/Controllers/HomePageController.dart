import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Models/GetProductModel.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<GetProductModel> productList = [];

}