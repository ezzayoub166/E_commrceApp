import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

import '../screens/product_details/widget/product_datils_image_slider.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double scalePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brandModel;
  String? description;
  String? categoryID;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariation;

  ProductModel(
      {required this.id,
      required this.stock,
      this.sku,
      required this.price,
      required this.title,
      this.date,
      this.scalePrice = 0.0,
      required this.thumbnail,
      this.isFeatured = false,
      this.brandModel,
      this.description,
      this.categoryID,
      this.images,
      required this.productType,
      this.productAttributes,
      this.productVariation});

  ///Create Empty function for clean code
  static ProductModel empty() => ProductModel(
      id: '',
      stock: 0,
      price: 0,
      title: '',
      thumbnail:
          'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
      productType: '');

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Stock": stock,
      "SKU": sku,
      "Price": price,
      "Title": title,
      "ScalePrice": scalePrice,
      "Thumbnail": thumbnail,
      "IsFeatured": isFeatured,
      "BrandModel": brandModel?.toJson(), // Use the null-aware operator
      "Description": description,
      "CategoryID": categoryID,
      "Images": images ?? [],
      "ProductType": productType,
      "ProductAttributes": productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      "ProductVariation": productVariation != null
          ? productVariation!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return ProductModel.empty();

    return ProductModel(
      id: document.id, // Use document.id for the ID
      stock: data['Stock'] ?? 0,
      sku: data['SKU'],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      title: data["Title"] ?? '',
      scalePrice: double.parse((data["ScalePrice"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? '',
      isFeatured: data["IsFeatured"] ?? false,
      brandModel: data["BrandModel"] != null
          ? BrandModel.fromJson(data["BrandModel"])
          : null,
      description: data["Description"] ?? '',
      categoryID: data["CategoryID"] ?? '',
      // images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      images: data['Images'] != null && (data['Images'] as List).isNotEmpty
          ? List<String>.from(data['Images']).where((url) => validateURL(url)).toList()
          : [TImages.notFound],
      productType: data["ProductType"] ?? '',
      productAttributes: data['ProductAttributes'] != null
          ? (data['ProductAttributes'] as List<dynamic>)
              .map((e) => ProductAttributeModel.fromJson(e))
              .toList()
          : [],
      productVariation: data['ProductVariation'] != null
          ? (data['ProductVariation'] as List<dynamic>)
              .map((e) => ProductVariationModel.fromJson(e))
              .toList()
          : [],
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id, // Use document.id for the ID
      stock: data['Stock'] ?? 0,
      sku: data['SKU'],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      title: data["Title"] ?? '',
      scalePrice: double.parse((data["ScalePrice"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? TImages.notFound,
      isFeatured: data["IsFeatured"] ?? false,
      brandModel: data["BrandModel"] != null
          ? BrandModel.fromJson(data["BrandModel"])
          : null,
      description: data["Description"] ?? '',
      categoryID: data["CategoryID"] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [TImages.notFound],
      productType: data["ProductType"] ?? '',
      productAttributes: data['ProductAttributes'] != null
          ? (data['ProductAttributes'] as List<dynamic>)
              .map((e) => ProductAttributeModel.fromJson(e))
              .toList()
          : [],
      productVariation: data['ProductVariation'] != null
          ? (data['ProductVariation'] as List<dynamic>)
              .map((e) => ProductVariationModel.fromJson(e))
              .toList()
          : [],
    );
  }

//
}

