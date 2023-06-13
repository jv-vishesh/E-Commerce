import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Models/GetProductModel.dart';
import 'package:ecommerceapp/SharedPreferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Models/ViewProductModel.dart';
import '../SharedPreferences/PrefKeys.dart';

class HomePageController extends GetxController {

  late ViewProductsModel viewProducts;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<GetProductModel> productList = [];
  final FirebaseAuth auth = FirebaseAuth.instance;
  DocumentReference? currentUserReference = FirebaseFirestore.instance
      .collection("User")
      .doc(UserPreference.getValue(key: PrefKeys.signInId));

  ViewProductsModel viewProduct(ViewProductsModel products) {
    viewProducts = products;
    return viewProducts;
  }

  productReferance({String? id}) {
    DocumentReference? productRefrence =
    FirebaseFirestore.instance.collection("ProductCategory").doc(id);
    return productRefrence;
    //  else {
    //   Get.snackbar("Error", "This Product is already Added");
    // }
  }


//.collection().doc(currentUser!.uid);
}
