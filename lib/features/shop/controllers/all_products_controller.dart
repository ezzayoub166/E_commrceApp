import 'package:e_commerce_app/data/repositories/product_repository.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance  => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption ='Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try{
      if(query == null) return[];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    }catch(e){
      TLoader.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return[];
    }
  }



  void sortProducts(String sortOption){
    selectedSortOption.value = sortOption;
    switch(sortOption){
      case 'Name':
        products.sort((a,b)=>a.title.compareTo(b.title));
        break;
      case "Higher Price":
        products.sort((a,b)=>b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a,b)=>a.price.compareTo(b.price));
        break;
      case "Sale":
        products.sort((a,b){
          if(b.scalePrice > 0){
            return b.scalePrice.compareTo(a.scalePrice);
          }else if(a.scalePrice > 0){
            return -1;
          }else{
            return 1;
          }
        });
        break;
      case "Newest":
        products.sort((a,b) => a.date!.compareTo(b.date!));
        break;
      default:
        //Default sorting option Name :
        products.sort((a,b)=>a.title.compareTo(b.title));
        break;
    }
  }

  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}