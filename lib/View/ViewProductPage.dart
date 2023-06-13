import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Controllers/HomePageController.dart';
import 'package:ecommerceapp/Controllers/ViewProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProductPage extends GetView<HomePageController> {
  final ViewProductController viewProductController =
      Get.put(ViewProductController());
  final String? productImage;
  final String? brandName;
  final String? productName;
  final String? size;
  final String? id;

  ViewProductPage({
    super.key,
    this.productImage,
    this.brandName,
    this.productName,
    this.size,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            productName?.toUpperCase() ?? "",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 414,
              color: Colors.green,
              child: productImage != null && productImage != ""
                  ? Image.network(
                      productImage ?? "",
                      fit: BoxFit.fill,
                    )
                  : const Icon(Icons.error),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 163,
                        color: Colors.yellow[800],
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 10, bottom: 10),
                          child: Text(
                            size ?? "",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sometimes life feels like a carnival, lots of ups and downs and 360 spins, maybe a few bumps along the way. With this in mind, Marcelo Burlon County of Milan presents this black cotton bumper car print T-shirt. Enjoy the ride! Featuring a ribbed crew neck, short sleeves, a graphic print and a straight fit.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        brandName ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const Text(
                        "\$250",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                      future: controller.currentUserReference?.get(),
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                List myCart = snapshot
                                    .data!["my_cart"]
                                    .map((p0) => p0)
                                    .toList() ??
                                    [];
                                myCart.add(controller.productReferance(id: id));
                                print(myCart);
                                await controller.fireStore
                                    .collection('User')
                                    .doc(controller.auth.currentUser?.uid)
                                    .update({
                                  "my_cart": myCart,
                                });
                              },
                              child: Container(
                                height: 38,
                                width: 267,
                                color: Colors.yellow[800],
                                child: const Center(
                                    child: Text(
                                  "ADD TO BAG",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                            const Icon(Icons.favorite_border),
                          ],
                        );
                      })
                ],
              ),
            )
          ],
        ));
  }
}
