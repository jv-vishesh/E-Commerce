import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Controllers/MyBagController.dart';
import 'package:ecommerceapp/Controllers/ViewProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBagPage extends GetView<MyBagController> {
  final MyBagController myBag = Get.find<MyBagController>();
  final ViewProductController viewProductController =
      Get.put(ViewProductController());

  MyBagPage({
    super.key,
  });

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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  FutureBuilder<DocumentSnapshot?>(
                      future: controller.currentUserReference?.get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          controller.cartList =
                              snapshot.data!["my_cart"].map((p0) => p0).toList() ?? [];
                          print(controller.cartList.length);
                        }
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.cartList.length,
                            itemBuilder: (context, index) {
                              return StreamBuilder<DocumentSnapshot>(
                                  stream: controller.cartList[index].snapshots() ?? "",
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text("Error ${snapshot.error}");
                                    }
                                    Map<String, dynamic>? data =
                                        snapshot.data?.data() as Map<String, dynamic>?;
                                    return Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 18.0,),
                                      child: Container(
                                        height: 144,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 0.2)),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 144,
                                              width: 104,
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 0.1)),
                                              child: Image.network(
                                                data?['productImage'] ??
                                                    "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    data?['productName'] ?? "",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                  Text(
                                                    data?['brand'] ?? "",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                  Text(
                                                    "Size:- ${data?['size'] ?? ""}",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        "Colors:-",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 13,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "Black",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        "Quntity :-",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 13),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "2",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                  const Text(
                                                    "Rs.4000",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 158.0, bottom: 100),
                                              child: InkWell(
                                                  onTap: () async {
                                                    controller.cartList
                                                        .remove(data?[index]);
                                                    // controller.currentUserReference?.delete();
                                                  },
                                                  child: const Icon(
                                                    Icons.more_vert,
                                                    color: Colors.grey,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            });
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
