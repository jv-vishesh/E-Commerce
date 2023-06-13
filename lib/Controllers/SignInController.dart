import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../Core/Routes/route_name.dart';
import '../SharedPreferences/PrefKeys.dart';
import '../SharedPreferences/shared_preferences.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController passwordController =
      TextEditingController(text: "1234567890");
  TextEditingController emailController =
      TextEditingController(text: "vish@gmail.com");
  AccessToken? accessToken;
  Map<String, dynamic>? _userData;

  googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        _auth.signInWithCredential(authCredential);
        UserPreference.setValue(
            key: PrefKeys.signInAndSignUp, value: authCredential.accessToken);
        print(authCredential);
        _firestore.collection('User').doc(googleSignInAccount.id).set({
          "name": googleSignInAccount.displayName,
          "email": googleSignInAccount.email,
          "id": googleSignInAccount.id,
          "my_cart": [],
        });
        UserPreference.setValue(
            key: PrefKeys.signInId, value: googleSignInAccount.id);
        Get.toNamed(navigationPage);
      } else {
        Get.snackbar('something Went wrong', "");
        return null;
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  Future<void> facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        accessToken = result.accessToken;
        final firebaseAuthCred =
            FacebookAuthProvider.credential(accessToken!.token);
        final result2 =
            await FirebaseAuth.instance.signInWithCredential(firebaseAuthCred);
        await _firestore.collection('User').doc(_auth.currentUser?.uid).set({
          "name": _auth.currentUser?.displayName,
          "email": _auth.currentUser?.email,
          "id": _auth.currentUser?.uid,
          "my_cart": []
        });

        print(result2.user?.displayName);
        UserPreference.setValue(
            key: PrefKeys.signInId,
            value: FirebaseAuth.instance.currentUser?.uid);
        UserPreference.setValue(
            key: PrefKeys.signInAndSignUp, value: result2.user?.displayName);

        final userData = await FacebookAuth.instance.getUserData();
        _userData = userData;
        UserPreference.setValue(
            key: PrefKeys.signInAndSignUp, value: result.accessToken?.token);
        print(
            UserPreference.getValue(key: PrefKeys.signInAndSignUp.toString()));
        Get.toNamed(navigationPage);
      } else {
        print(result.status);
        print(result.message);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', "No user found for email");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided for that user.");
      }
    }
  }

  Future<void> signInValidate() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      UserPreference.setValue(
          key: PrefKeys.signInAndSignUp, value: emailController.text);
      Get.toNamed(navigationPage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', "No user found for email");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided for that user.");
      }
    }
  }
}
