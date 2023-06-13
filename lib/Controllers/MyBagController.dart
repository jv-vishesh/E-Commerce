import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Models/GetProductModel.dart';
import 'package:ecommerceapp/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


class MyBagController extends GetxController{
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;
  List<DocumentSnapshot> users = <DocumentSnapshot>[];
  List<DocumentSnapshot> referenceDocuments = <DocumentSnapshot>[];
  List cartList = [];
  DocumentReference? currentUserReference = FirebaseFirestore.instance
      .collection("User")
      .doc(FirebaseAuth.instance.currentUser?.uid);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot snapshot = await fireStore.collection('users').get();
    users = snapshot.docs;
  }

  void fetchReferenceDocuments(DocumentSnapshot user) async {
    QuerySnapshot snapshot =
    await user.reference.collection('ProductCategory').get();
    referenceDocuments = snapshot.docs;
  }


  // void fetchUserData(String userId) {
  //   currentUserReference.child(userId).once().then((DataSnapshot snapshot) {
  //     if (snapshot.value != null) {
  //       Map<String, dynamic> userData = snapshot.value;
  //       user.value = User(
  //         userId: userData['userId'],
  //         email: userData['email'],
  //         cartItems: List<String>.from(userData['cartItems']),
  //       );
  //     } else {
  //       // User not found
  //     }
  //   }).catchError((error) {
  //     // Handle error
  //   });
  // }
}


