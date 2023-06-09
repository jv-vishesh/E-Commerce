import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import '../Core/Routes/route_name.dart';
import '../SharedPreferences/PrefKeys.dart';
import '../SharedPreferences/shared_preferences.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController passwordController = TextEditingController(text: "1234567890");
  TextEditingController emailController = TextEditingController(text: "vish@gmail.com");
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
            key: PrefKeys.googleToken, value: authCredential.accessToken);
        print(authCredential);
        await _firestore.collection('User').doc(
            googleSignInAccount.id).set({
          "name": googleSignInAccount.displayName,
          "email":googleSignInAccount.email,
          "id": googleSignInAccount.id,
        });
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
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      accessToken = result.accessToken;
      final firebaseAuthCred =
      FacebookAuthProvider.credential(accessToken!.token);
      final result2 =
      await FirebaseAuth.instance.signInWithCredential(firebaseAuthCred);
      await _firestore.collection('User').doc(
          _auth.currentUser?.uid).set(
          {
            "name": _auth.currentUser?.displayName,
            "email": _auth.currentUser?.email,
            "id": _auth.currentUser?.uid
          });

      print(result2.user?.displayName);
      UserPreference.setValue(
          key: PrefKeys.faceBookName, value: result2.user?.displayName);

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
      UserPreference.setValue(
          key: PrefKeys.facebookToken, value: result.accessToken?.token);
      print(UserPreference.getValue(key: PrefKeys.facebookToken.toString()));
      Get.toNamed(navigationPage);
    } else {
      print(result.status);
      print(result.message);
    }
  }
}
