import 'package:ecommerceapp/Controllers/MyBagController.dart';
import 'package:ecommerceapp/Controllers/ViewProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/addToCartModel.dart';

class MyBagPage extends GetView<ViewProductController> {
  final String? productNames;
  final String? productImages;
  final String? sizes;
  final String? productBrands;
  final ViewProductController myBagController=Get.put(ViewProductController());
   MyBagPage(
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
          Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final AddtocartProducts products=controller.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        height: 144,
                        decoration: BoxDecoration(border: Border.all(width: 0.2)),
                        child: Row(
                          children: [
                            Container(
                              height: 144,
                              width: 104,
                              decoration: BoxDecoration(border: Border.all(width: 0.1)),
                              child: Image.network(products.productImage??"",fit: BoxFit.fill,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(products.productNames??"",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                  Text(products.productBrands??"",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                  Text("Size:- ${products.productSize??""}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                  Row(
                                    children: [
                                      Text("Colors:-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Colors.grey),),
                                      SizedBox(width: 5,),
                                      Text("Black",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quntity :-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                      SizedBox(width: 5,),
                                      Text("2",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                    ],
                                  ),
                                  Text("Rs.4000",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14),),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 158.0,bottom: 100),
                              child: InkWell(
                                onTap: (){

                                },
                                  child: Icon(Icons.more_vert,color: Colors.grey,)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}
