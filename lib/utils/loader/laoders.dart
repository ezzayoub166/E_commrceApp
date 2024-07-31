import 'package:e_commerce_app/utils/constants/consts.dart';

class TLoader {

  static successSnackBar({required title , message = ''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(10),
        icon: Icon(Iconsax.check,color: TColors.white,)
    );
  }

  static warningSnackBar({required title , message = ''}) {
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: TColors.white,)
    );
  }

    static errorSnackBar({required title, message = ''}) {
      Get.snackbar(
          title,
          message,
          isDismissible: true,
          shouldIconPulse: true,
          colorText: TColors.white,
          backgroundColor: Colors.red.shade600,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(20),
          icon: Icon(Iconsax.warning_2, color: TColors.white,)
      );
    }
  }