import 'package:e_commerce_app/data/repositories/brand_repository.dart';
import 'package:e_commerce_app/data/repositories/product_repository.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  Rx<bool> isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository()); 

  @override
  void onInit() {
    // TODO: implement onInit
    getFeaturdBrands();
    super.onInit();
    

  }

  Future<void> getFeaturdBrands()async{
    try{
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));
      isLoading.value = false;


    }catch(errorMessage){
      isLoading.value = false;
     TLoader.errorSnackBar(title: 'Oh Snap!',message: errorMessage.toString());
    }
  }

  //Get brand Specfic products from your data source 
  Future<List<ProductModel>> getBrandProducts(String brandID)async{
    try{
  final products = await ProductRepository.instance.getProductsForBrand(BrnadID: brandID,);
    return products;
    }catch(erorMessage){
      TLoader.errorSnackBar(title: "Oh Snap!",message: erorMessage.toString());
      return [];
    }
  

  }


}