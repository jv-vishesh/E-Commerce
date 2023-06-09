import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import '../Core/Routes/route_name.dart';
import '../SharedPreferences/PrefKeys.dart';
import '../SharedPreferences/shared_preferences.dart';

class SignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
        FirebaseAuth.instance.signInWithCredential(authCredential);
        UserPreference.setValue(
            key: PrefKeys.googleToken, value: authCredential.accessToken);
        print(authCredential);
        Get.toNamed(navigationPage);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar() ;
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
