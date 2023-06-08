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
  TextEditingController nameController =
      TextEditingController(text: "visheshpa");
  TextEditingController passwordController =
      TextEditingController(text: "1234567890");
  TextEditingController emailController =
      TextEditingController(text: "vish@gmail.com");
  AccessToken? _accessToken;

  Map<String, dynamic>? _userData;
  //final FirebaseAuth auth = FirebaseAuth.instance;
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
        print(authCredential);
        Get.toNamed(navigationBarPage);

      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  googleSignOut() async {
    _googleSignIn.signOut();
  }

  Future<void> facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;

      UserPreference.setValue(key: PrefKeys.facebookToken,value: result.accessToken!.token);
      print(UserPreference.getValue(key: PrefKeys.facebookToken));
      Get.toNamed(navigationBarPage);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  facebookLogout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
   await UserPreference.removeKey(key: PrefKeys.facebookToken);
   print(UserPreference.removeKey(key: PrefKeys.facebookToken));
    update();
  }
}
