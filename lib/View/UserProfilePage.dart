import 'package:ecommerceapp/Controllers/ProfilePageController.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Core/Widget/CustomProfilePageContainer.dart';
import '../SharedPreferences/PrefKeys.dart';
import '../SharedPreferences/shared_preferences.dart';

class UserProfilePage extends GetView<ProfilePageController> {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 99.0, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Profile",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 34),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL == null
                        ? "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                        : FirebaseAuth.instance.currentUser!.photoURL
                            .toString(),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.usernames??"No Name",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser?.email.toString() ??
                          "Loging with email",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            const ProfilePageCustomContainer(titleText: 'My Orders', messageField: 'Already Have 2 Orders'),
            const ProfilePageCustomContainer(titleText: 'Shipping Adresses', messageField: '2 Adresses'),
            const ProfilePageCustomContainer(titleText: 'Payment Method', messageField: 'Visa **89'),
            const ProfilePageCustomContainer(titleText: 'Promocodes', messageField: 'You dont\'t have spacial promocodes'),
            const ProfilePageCustomContainer(titleText: 'My Reviews', messageField: 'Reviews for 12 Items'),
            const ProfilePageCustomContainer(titleText: 'Settings', messageField: 'Notifications, password',),
            InkWell(
              onTap: () {
                Get.defaultDialog(
                    buttonColor: Colors.yellow[800],
                    cancelTextColor: Colors.black,
                    confirmTextColor: Colors.black,
                    title: "Sign Out",
                    content: const Text("Are You sure you want to Sign out.."),
                    textConfirm: "Sign Out",
                    onConfirm: () {
                      controller.googleSignOut();
                      controller.emailAndPasswordSignOut();
                      controller.facebookLogout();
                      UserPreference.removeKey(key: PrefKeys.faceBookName);
                      UserPreference.removeKey(key: PrefKeys.emailToken);
                      Get.offAll(logInPage);
                    },
                    onCancel: () {
                      Navigator.pop(context);
                    });
              },
              child:const ProfilePageCustomContainer(titleText:'Sign Out' ,messageField:'Sign out or Log out from App' ,)
            ),
          ],
        ),
      ),
    );
  }
}
