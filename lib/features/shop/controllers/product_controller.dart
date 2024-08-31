import 'package:e_commerce_app/data/repositories/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/data/dummy_data.dart';
import 'package:e_commerce_app/utils/enum/enums.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  var productRepository = Get.put(ProductRepository());

  final isLoading = false.obs;

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;



  @override
  void onInit()  {
    // TODO: implement onInit
    fetchFeaturedProducts();
    super.onInit();

  }

  void fetchFeaturedProducts()async{
    try{
      isLoading.value = true;
      // Simulate a delay
      // await Future.delayed(Duration(seconds: 2));

      // Fetch Products
        productRepository.getFeaturedProducts().then((products){
        featuredProducts.assignAll(products);
        print(featuredProducts.length);

      });
      // print("Fetched products: $products");

      // Assign Products
      // if (products.isNotEmpty) {
      //   featuredProducts.assignAll(products);
      //   print("Featured products assigned: $featuredProducts");
      // } else {
      //   print("No featured products found.");
      // }
    }catch(errorMessage){
      TLoader.errorSnackBar(title: 'Oh snap!',message: errorMessage.toString());
    }finally{
      isLoading.value = false;
      print("Fetching process completed. isLoading: ${isLoading.value}");

    }
  }

  ///Get the product price or price range for variations
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    //If no variations exist,return the simple price or sale price
    if(product.productType == ProductType.single.toString()){
      return (product.scalePrice! > 0 ? product.scalePrice : product.price).toString();
    }else {
      //Calculate the smallest and largest prices among variations
      for(var variation in product.productVariation ?? []) {
        double priceToConsider = variation.scalePrice > 0.0 ? variation
            .scalePrice : variation.price;

        //update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }


        if (priceToConsider > smallestPrice) {
          largestPrice = priceToConsider;
        }
      }
        //if smallest and largest are the same ,return single price
        if(smallestPrice.isEqual(largestPrice)){
          return largestPrice.toString();
        }else{
          return '$smallestPrice - \$$largestPrice';
        }
      }
    }


    /// --- Calculate Discount Percentage

    String? calculateSalePercentage(double originalPrice , double? salePrice){
    if(salePrice == null || salePrice <=0.0 )return null;
    if(originalPrice <=0 )return null;
    double percentage = ((originalPrice - salePrice)/originalPrice) * 100;
    return percentage.toStringAsFixed(0);
    }

/// --- Check Product Stock Status
    String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' :'Out of Stock';
    }
  }
