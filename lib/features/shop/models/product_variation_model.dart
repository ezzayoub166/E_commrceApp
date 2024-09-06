class ProductVariationModel{
  final String id ;
  String sku ;
  String image ;
  String? description ;
  double price ;
  double scalePrice ;
  int stock;
  Map<String,String> attributesValues ;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.scalePrice = 0.0,
    this.stock = 0 ,
    required this.attributesValues
});

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributesValues: {});


  Map<String, dynamic> toJson() {
    return {
      "Id": this.id,
      "Sku": this.sku,
      "Image": this.image,
      "Description": this.description,
      "Price": this.price,
      "ScalePrice": this.scalePrice,
      "Stock": this.stock,
      "AttributesValues": this.attributesValues,
    };
  }


  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    return ProductVariationModel(id: data["Id"],
      sku: data["Sku"],
      image: data["Image"],
      description: data["Description"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      scalePrice: double.parse((data["ScalePrice"] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributesValues: Map<String, String>.from(
          json["AttributesValues"]),);
  }

}