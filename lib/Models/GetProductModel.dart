import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductModel {
  final String? productName;
  final String? brandName;
  final String? size;
  final String? id;
  final String? productImage;

  GetProductModel(
      {this.productName,
        this.brandName,
        this.size,
        this.id,
        this.productImage
        });

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<GetProductModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;

      return GetProductModel(
        productName: dataMap['productName'],
        brandName: dataMap['brand'],
        size: dataMap['size'],
        id: snapshot.reference.id,
        productImage: dataMap['productImage'],

      );
    }).toList();
  }
}