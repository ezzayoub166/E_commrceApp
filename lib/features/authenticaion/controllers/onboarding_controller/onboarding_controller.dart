import 'package:e_commerce_app/features/authenticaion/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  //Variables

  final pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;

  //update Current index when page Scroll
  void updatePageIndicator(index) => currentPageIndex .value= index;

  void dotNavigate(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);

  }

  void nextPage(){
    if(currentPageIndex.value == 2){
      final storage = GetStorage();
      if(kDebugMode){
        print("=================Get Storage With next Button=================");
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);
      Get.to(LoginScreen());
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}