import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Controllers/HomePageController.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:ecommerceapp/Models/GetProductModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ViewProductPage.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  // final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      // ),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  height: 409,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://assets.gqindia.com/photos/63f59ea391ca0ba3444a6c3f/1:1/w_1600%2Cc_limit/1247338339",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 208.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Givenchy",
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      const Text(
                        "The Latest Drop",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 102.0),
                        child: Container(
                          height: 40,
                          width: 170,
                          color: Colors.white,
                          child: const Center(
                              child: Text(
                            "SHOP NOW",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w900),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: controller.fireStore
                        .collection("ProductCategory")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: const CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        controller.productList = GetProductModel()
                            .dataListFromSnapshot(snapshot.data!);
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 29,
                                childAspectRatio: 0.80),
                        itemBuilder: (context, index) {

                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {

                                    Get.to(
                                      ViewProductPage(
                                        productImage: controller
                                            .productList[index].productImage,
                                        productName: controller
                                            .productList[index].productName,
                                        size: controller
                                            .productList[index].size,
                                        brandName: controller
                                            .productList[index].brandName,
                                        id: controller
                                            .productList[index].id,
                                        // getProductModel: snapshot.data!.docs[index],
                                      ),
                                    );
                                  },
                                  child: Container(
                                      height: 208,
                                      width: 161,
                                      decoration:  BoxDecoration(border:controller.productList[index]
                                          .productImage !=
                                          "" &&  controller.productList[index]
                                          .productImage !=
                                          null
                                          ?Border():Border.all(),
                                         ),
                                      child: controller.productList[index]
                                                  .productImage !=
                                              "" &&  controller.productList[index]
                                          .productImage !=
                                          null
                                          ? Image.network(
                                              controller.productList[index]
                                                  .productImage??"",
                                              fit: BoxFit.fill,
                                            )
                                          : Icon(Icons.error)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  controller.productList[index].productName ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  controller.productList[index].brandName ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
