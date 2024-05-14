import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  final String id;
  int distance;
  String shopname;
  String ownerName;
  String ownerPic;
  String phone;
  int price;
  String shopImg;

  ShopModel({
    required this.id,
    required this.distance,
    required this.shopname,
    required this.ownerName,
    required this.ownerPic,
    required this.phone,
    required this.price,
    required this.shopImg,
  });

  static ShopModel empty() => ShopModel(
        id: '',
        distance: 0,
        shopname: '',
        ownerName: '',
        ownerPic: '',
        phone: '',
        price: 0,
        shopImg: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Distance': distance,
      'Name': shopname,
      'Owner_name': ownerName,
      'Owner_pic': ownerPic,
      'P_num': phone,
      'Price': price,
      'Shop_img': shopImg
    };
  }

  factory ShopModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ShopModel(
          id: document.id,
          distance: data['Distance'] ?? 0,
          shopname: data['Name'] ?? '',
          ownerName: data['Owner_name'] ?? '',
          ownerPic: data['Owner_pic'] ?? '',
          phone: data['P_num'] ?? '',
          price: data['Price'] ?? 0,
          shopImg: data['Shop_img'] ?? '');
    } else {
      return ShopModel.empty();
    }
  }
}
