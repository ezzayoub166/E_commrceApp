import 'package:e_commerce_app/features/shop/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ProductController());
  }
}