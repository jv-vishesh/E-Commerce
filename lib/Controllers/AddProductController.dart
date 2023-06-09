import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddProductController extends GetxController {

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  TextEditingController productNameController =
  TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  RxBool isLoading = false.obs;
  XFile? selectedImage;
  FirebaseStorage storage = FirebaseStorage.instance;
  RxString imageUrl = ''.obs;

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    selectedImage = pickedImage;
    if (selectedImage != null) {
      await uploadPic(selectedImage!);
    }
    update();
  }

  Future<void> uploadPic(XFile imageName) async {
    isLoading.value = true;
    String fileName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Reference reference =
    FirebaseStorage.instance.ref("Images").child(fileName);
    UploadTask uploadTask = reference.putFile(File(imageName.path));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {print("upload completed");});
    String url = await taskSnapshot.ref.getDownloadURL();
    imageUrl.value = url;
    isLoading.value = false;
    update();
  }


  Future<void> addProducts(
      {String? productName, brandName, size, image}) async {
    await _fireStore.collection("ProductCategory").doc().set({
      "productName": productName,
      "brand": brandName,
      "size": size,
      "productImage": image,
    }).catchError((e) => print("$e"));
  }
}