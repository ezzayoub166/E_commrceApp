import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/popups/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text , String animation){
    showDialog(context: Get.overlayContext!,barrierDismissible: false,
        builder:(_) => PopScope(
            canPop: false,
            child:Container(
              color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 250,),
                  TAnimationLoaderWidget(text: 'We are processing your information...',
                      animation: animation)
                ],
              ),
            ) )
    );
  }

  static stopLoading(){
    Navigator.pop(Get.overlayContext!);
  }
}