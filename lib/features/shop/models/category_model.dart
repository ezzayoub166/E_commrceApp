import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      this.parentId = '',
      required this.isFeatured});

  ///Empty Helper Function
  static CategoryModel empty() => CategoryModel(
      id: '', name: '', image: '', parentId: '', isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      "Name": this.name,
      "Image": this.image,
      "ParentId": this.parentId,
      "IsFeatured": this.isFeatured,
    };
  }

  ///convert model to json structure so that you can store data in fireBase
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //Map JSON Record to the Model
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['IsFeatured'] ?? '',
          parentId: data['ParentId'] ?? false);
    }else{
      return CategoryModel.empty();
    }
  }
}
