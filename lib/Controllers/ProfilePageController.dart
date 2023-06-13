import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../SharedPreferences/PrefKeys.dart';
import '../SharedPreferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  String? usernames;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  onInit() async {
    super.onInit();
    await getUserName();
    update();
  }

  Future<String?> getUserName() async {
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection('User')
        .doc(UserPreference.getValue(key: PrefKeys.signInId))
        .get();
    print(
        '====================${user.data().runtimeType}+${user.data()?['name']}');
    usernames = user.data()?['name'];
    update();
    return usernames;
  }

  googleSignOut() async {
    _googleSignIn.signOut();
    UserPreference.removeKey(key: PrefKeys.signInAndSignUp);
  }

  facebookLogout() async {
    await FacebookAuth.instance.logOut();
    await UserPreference.removeKey(key: PrefKeys.signInAndSignUp);
    //update();
  }

  emailAndPasswordSignOut() async {
    FirebaseAuth.instance.signOut();
    UserPreference.removeKey(key: PrefKeys.signInAndSignUp);
  }
}
