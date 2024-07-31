import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}