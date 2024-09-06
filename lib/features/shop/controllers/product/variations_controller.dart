import 'package:e_commerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
class VariationsController extends GetxController{
  static VariationsController get instance => Get.find();

  ///Variables
   RxMap selectedAttributes = {}.obs;
   RxString variationsStockStatus = ''.obs;
   Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

   /// === Select Attribute and variation
   void onAttributeSelected(ProductModel product , attributeName , attributeValue){
     //when attribute is selected we will first add that attribute to the selectedAttributes
     final selectedAttributes = Map<String,dynamic>.from(this.selectedAttributes);
     selectedAttributes[attributeName] = attributeValue;
     this.selectedAttributes[attributeName] = attributeValue;

     final selectedVariation = product.productVariation!.firstWhere((variation) => _isSameAttributeValues(variation.attributesValues, selectedAttributes),orElse: () => ProductVariationModel.empty());

     //show the selected Variation image as Main image
     if(selectedVariation.image.isNotEmpty){
       ImagesController.instance.selectedProductImage.value = selectedVariation.image;
     }

     //Assign Selected variation
     this.selectedVariation.value = selectedVariation;

     //Update selected product variation status
     getProductVariationStockStatus();


   }

  /// === Check If Attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String,dynamic> variationAttributes,Map<String,dynamic> selectedAttributes){
     //If SelectedAttribute contain 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;
    //IF any of attributes is different then return e.g[Green,large] x [Green,Small]
    for(final key in variationAttributes.keys){
      //Attribute[key]=value
      if(variationAttributes[key] != selectedAttributes[key]) return false;

    }
    return true;

  }

  /// === Check Attribute availability / Stock in variation
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations , String attributeName){
     //Pass the variation to check which attribute are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) => variation.attributesValues[attributeName] != null && variation.attributesValues[attributeName]!.isNotEmpty && variation.stock > 0 )
        //Fetch all non empty attributes of variations
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;

  }

  String getVariationPrice(){
     return (selectedVariation.value.scalePrice > 0 ? selectedVariation.value.scalePrice : selectedVariation.value.price).toString();
  }

  /// === Check Product variations Stock Status
  void getProductVariationStockStatus(){
     variationsStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
   }

/// === Reset Selected Attributes when switching products
 void  resetSelectedAttributes(){
     selectedAttributes.clear();
     variationsStockStatus.value = '';
     selectedVariation.value = ProductVariationModel.empty();
 }
}