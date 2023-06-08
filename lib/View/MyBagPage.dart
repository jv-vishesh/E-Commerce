import 'package:ecommerceapp/Controllers/MyBagController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBagPage extends StatelessWidget {
 final MyBagController myBagController=Get.put(MyBagController());
   MyBagPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 99.0,left: 16),
            child: Text("My Bag",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w900),),
          ),
          SizedBox(height:  24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Enter your promo code",style: TextStyle(color: Colors.grey),),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_forward_rounded)
              ),
            ),
          ),
          SizedBox(height: 23,),
          Expanded(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                    itemBuilder: (context,index){
                  return Container(
                    height: 144,
                    child: Row(
                      children: [
                        Container(
                          width: 104,
                          //child: Image.network(""),
                        )
                      ],
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
