import 'dart:async';

import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class VerifyEmailController extends GetxController{

  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirect();
  }


  sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnackBar(title: 'Email send',message: 'Please Check your inbox and verify email');
    }
    catch(e){
      TLoader.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  setTimerForAutoRedirect(){
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        ///Get.off() : this destroy the previous screen (mean the verification)
        Get.off(() => SuccessScreen(
            image: TImages.checker_email_verification_animation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }
  ///Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await currentUser.reload(); // Reload the user data
      final updatedUser = FirebaseAuth.instance.currentUser; // Get the updated user data

      print(updatedUser?.email);
      print(updatedUser?.emailVerified);

      if (updatedUser!.emailVerified) {
        print("Email is verified");
        Get.off(() => SuccessScreen(
            image: TImages.checker_email_verification_animation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect()));
      } else {
        print("Email is not verified");
      }
    } else {
      print("No current user");
    }
  }

}