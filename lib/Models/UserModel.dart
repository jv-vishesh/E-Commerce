import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Models/GetProductModel.dart';

class UserModel {
  final String? email;
  final String? id;
  final String? name;
  final List<GetProductModel>? myCart;

  UserModel({this.id, this.email, this.name, this.myCart});

  List<UserModel> UserdataListFromSnapshot(QuerySnapshot querySnapshotOfUser) {
    return querySnapshotOfUser.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;
      return UserModel(
        email: dataMap['email'],
        name: dataMap['name'],
        myCart:  List<GetProductModel>.from(dataMap['my_cart']),
        id: snapshot.reference.id,
      );
    }).toList();
  }
}
