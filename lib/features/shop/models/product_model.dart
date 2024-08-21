import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation_model.dart';

class ProductModel{
  String id ;
  int stock ;
  String? sku ;
  double price ;
  String title ;
  DateTime? date;
  double? scalePrice ;
  String thumbnail;
  bool? isFeatured ;
  BrandModel? brandModel;
  String? description;
  String? categoryID;
  List<String>? images;
  String productType ;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariation;

  ProductModel({
      required this.id,
      required this.stock,
      this.sku,
      required this.price,
      required this.title,
      this.date,
    this.scalePrice,
      required this.thumbnail,
      this.isFeatured,
      this.brandModel,
      this.description,
      this.categoryID,
      this.images,
      required this.productType,
      this.productAttributes,
      this.productVariation});

  ///Create Empty function for clean code
  static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

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
      "BrandModel": brandModel!.toJson(),
      "Description": description,
      "CategoryID": categoryID,
      "Images": images ?? [],
      "ProductType":productType,
      "ProductAttributes": productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      "ProductVariation": productVariation != null ? productVariation!.map((e) => e.toJson()).toList() : [],
    };
  }

  factory ProductModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document;
    return ProductModel(
      id: data.id,
      stock: data['Stock'] ?? 0,
      sku: data['SKU'],
      price: double.parse((data["Price"]??0.0).toString()),
      title: data["Title"] ,
      scalePrice: double.parse((data["ScalePrice"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? '',
      isFeatured: data["IsFeatured"] ?? false,
      brandModel: BrandModel.fromJson(data["BrandModel"]),
      description: data["Description"] ?? '',
      categoryID: data["CategoryID"] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images'])  : [] ,
      productType: data["ProductType"] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariation: (data['ProductVariation'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
//
}