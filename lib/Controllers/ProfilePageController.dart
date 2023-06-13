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

  onInit() {
    super.onInit();
    getusername();
    //update();
  }

  Future<String?> getusername() async {
    if (UserPreference.getValue(key: PrefKeys.faceBookName) != null) {
     usernames= await UserPreference.getValue(key: PrefKeys.faceBookName);
    } else if (FirebaseAuth.instance.currentUser?.displayName != null) {
    usernames=  await FirebaseAuth.instance.currentUser?.displayName;
    } else if(UserPreference.getValue(key: PrefKeys.faceBookName) != null && FirebaseAuth.instance.currentUser?.displayName != null){
      usernames = await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        return value.data()?['name'];
      });
    }else{
      return null;
    }
    return usernames;
  }

  googleSignOut() async {
    _googleSignIn.signOut();
    UserPreference.removeKey(key: PrefKeys.googleToken);
  }

  facebookLogout() async {
    await FacebookAuth.instance.logOut();
    await UserPreference.removeKey(key: PrefKeys.facebookToken);
    //update();
  }

  emailAndPasswordSignOut() async {
    FirebaseAuth.instance.signOut();
    UserPreference.removeKey(key: PrefKeys.emailToken);
  }
}
