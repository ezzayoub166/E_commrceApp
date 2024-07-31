import 'package:e_commerce_app/utils/constants/consts.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index; 
  }
}