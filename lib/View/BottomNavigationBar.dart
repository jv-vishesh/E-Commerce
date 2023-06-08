import 'package:ecommerceapp/Controllers/bottom_navigation_bar_controller.dart';
import 'package:ecommerceapp/View/AddProductsPage.dart';
import 'package:ecommerceapp/View/MyBagPage.dart';
import 'package:ecommerceapp/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/AddProductController.dart';

class BottomNavigationBarPage extends GetView<BottomNavigationBarController> {
 final AddProductController addProductController= Get.put(AddProductController());
   BottomNavigationBarPage({super.key});

  final screens=[
    HomePage(),
    const AddProductPage(),
    MyBagPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: controller.selectedIndex.value,
            onTap: (index){
            controller.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.add),label: "Add"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart")
            ]),
      ),
    ) ;
  }
}
