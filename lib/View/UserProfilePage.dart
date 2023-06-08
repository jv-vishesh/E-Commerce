import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 99.0,left: 16,right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Profile",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 34),),
            const SizedBox(height: 14,),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  foregroundImage: NetworkImage(FirebaseAuth.instance.currentUser?.photoURL.toString()??
                          "https://cdn-icons-png.flaticon.com/512/149/149071.png",),
                ),
                const SizedBox(width: 18,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(FirebaseAuth.instance.currentUser?.displayName.toString()??"No Name Of User",style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                    Text(FirebaseAuth.instance.currentUser?.email.toString()??"Loging with email",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 21,),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 17,bottom: 13 ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("My orders",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        Text("Already have 2 orders",style: TextStyle(fontSize:11,fontWeight: FontWeight.w400,color: Colors.grey),)
                      ],
                    ),
                    Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 17,bottom: 13 ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping addresses",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        Text("2 Address",style: TextStyle(fontSize:11,fontWeight: FontWeight.w400,color: Colors.grey),)
                      ],
                    ),
                    Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 17,bottom: 13 ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment methods",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        Text("Visa  **89",style: TextStyle(fontSize:11,fontWeight: FontWeight.w400,color: Colors.grey),)
                      ],
                    ),
                    Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 17,bottom: 13 ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Promocodes",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        Text("You don’t have special promocodes",style: TextStyle(fontSize:11,fontWeight: FontWeight.w400,color: Colors.grey),)
                      ],
                    ),
                    Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 17,bottom: 13 ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("My reviews",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        Text("Reviews for 12 items",style: TextStyle(fontSize:11,fontWeight: FontWeight.w400,color: Colors.grey),)
                      ],
                    ),
                    Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child:  Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 17,bottom: 13 ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Settings",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        Text("Notifications, password",style: TextStyle(fontSize:11,fontWeight: FontWeight.w400,color: Colors.grey),),
                      ],
                    ),
                    Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}