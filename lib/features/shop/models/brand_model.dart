class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCont;

  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured = false,
      this.productCont = 0});

  ///Empty Helper Function.
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  ///Convert model to Json
  toJson() {
    return {
      'ID': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductCont': productCont
    };
  }

  ///Map json oriented document snapshot form firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['ID'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productCont: data['ProductCont'] ?? 0);
  }
}
