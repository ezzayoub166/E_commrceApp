import 'package:e_commerce_app/data/repositories/product_repository.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance  => Get.find();

  final repository = ProductRepository.instance;

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
}