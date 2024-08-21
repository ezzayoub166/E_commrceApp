import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl ;
  String targetScreen;
  bool active;

  BannerModel({required this.imageUrl, required this.targetScreen, required this.active});

  factory BannerModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String ,dynamic>;
    return BannerModel(
      imageUrl: data["ImageUrl"] ?? '',
      targetScreen: data["TargetScreen"] ?? '',
      active: data["Active"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ImageUrl": this.imageUrl,
      "TargetScreen": this.targetScreen,
      "Active": this.active,
    };
  }

//
}