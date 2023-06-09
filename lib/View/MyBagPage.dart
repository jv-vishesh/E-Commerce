import 'package:ecommerceapp/Controllers/MyBagController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBagPage extends StatelessWidget {
  final String? productNames;
  final String? productImages;
  final String? sizes;
  final String? productBrands;

  //final MyBagController myBagController=Get.put(MyBagController());
  const MyBagPage(
      {super.key,
      this.productNames,
      this.productImages,
      this.sizes,
      this.productBrands});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 99.0, left: 16),
            child: Text(
              "My Bag",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  label: Text(
                    "Enter your promo code",
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_forward_rounded)),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Expanded(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
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
