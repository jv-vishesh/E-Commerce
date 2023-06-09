import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:ecommerceapp/SharedPreferences/PrefKeys.dart';
import 'package:ecommerceapp/SharedPreferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  TextEditingController nameController=TextEditingController(text: "vishesh");
  TextEditingController passwordController = TextEditingController(text: "1234567890");
  TextEditingController emailController = TextEditingController(text: "vish@gmail.com");
  final FirebaseFirestore user = FirebaseFirestore.instance;

  Future<void> emailAndPasswordSignUP(
      String emails, dynamic passwords, String names) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emails, password: passwords);

    await user
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({"name": names, "email": emails, "password": passwords,"id": FirebaseAuth.instance.currentUser?.uid});
    UserPreference.setValue(key:PrefKeys.emailToken,value: FirebaseAuth.instance.currentUser?.uid);
    Get.toNamed(navigationPage);
  }


  }


