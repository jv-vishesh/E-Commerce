import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/SharedPreferences/PrefKeys.dart';
import 'package:ecommerceapp/SharedPreferences/shared_preferences.dart';
import 'package:get/get.dart';

class MyBagController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List users = [];
  List<DocumentSnapshot> referenceDocuments = <DocumentSnapshot>[];
  RxList cartList = [].obs;
  DocumentReference? currentUserReference;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    update();
  }


  void fetchData() async {
    DocumentReference? userReference = FirebaseFirestore.instance
        .collection("User")
        .doc(UserPreference.getValue(key: PrefKeys.signInId));
    QuerySnapshot snapshot = await fireStore.collection('users').get();
    users = snapshot.docs;
    currentUserReference = userReference;
    update();
  }
  void deleteCartItem(int cartIndex){
    FirebaseFirestore.instance.collection('User').doc(UserPreference.getValue(key: PrefKeys.signInId)).update(
        {'my_cart':FieldValue.arrayRemove([cartList?[cartIndex]])});
    update();
  }
}
