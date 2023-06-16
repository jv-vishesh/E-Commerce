import 'package:ecommerceapp/Controllers/AddProductController.dart';
import 'package:ecommerceapp/Core/Widget/CustomTextfromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends GetView<AddProductController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> fromKey = GlobalKey();
    return GetBuilder<AddProductController>(
        init: controller,
        builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 99, left: 8),
                      child: const Text(
                        "Add Product",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w700),
                      )),
                  const SizedBox(
                    height: 63,
                  ),
                  Form(
                    key: fromKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            label: 'Product Name',
                            controller: controller.productNameController,
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          CustomTextFormField(
                            label: 'Brand',
                            controller: controller.brandController,
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          CustomTextFormField(
                            label: 'Size',
                            controller: controller.sizeController,
                          ),
                          const SizedBox(
                            height: 58,
                          ),
                          GestureDetector(
                            onTap: () async {
                              controller.getImage();
                              //  controller.uploadPic(controller.productNameController.text);
                            },
                            child: Obx(
                              () {
                                if (controller.isLoading.value == true) {
                                  return Center(
                                    child: Container(
                                      height: 126,
                                      width: 158,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                      ),
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Container(
                                      height: 126,
                                      width: 158,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                      ),
                                      child: controller.imageUrl.value != "" &&
                                              controller.imageUrl.value != null
                                          ? Image.network(
                                              controller.imageUrl.value,
                                              fit: BoxFit.fill,
                                            )
                                          : const Icon(
                                              Icons.image,
                                              color: Colors.grey,
                                            ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (fromKey.currentState!.validate() &&
                            controller.imageUrl.value.isNotEmpty) {
                          await controller.addProducts();
                        } else {
                          Get.defaultDialog(
                              title: "Error",
                              content: Text('Image can\'t be empty'));
                        }
                      },
                      child: Container(
                        height: 40,
                        color: Colors.yellow[800],
                        child: const Center(
                            child: Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
