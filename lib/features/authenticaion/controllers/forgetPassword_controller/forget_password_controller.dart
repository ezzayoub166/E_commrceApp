import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/authenticaion/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  ///variables
   final email = TextEditingController();
   GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

   ///Send Reset Password Email
   sendPasswordResetEmail()async{
     try{
       //Start Loading
       TFullScreenLoader.openLoadingDialog('Processing your request....', TImages.loading_sing_up_animation);

       //Check Internet Connectivity
       final isConnected = await NetworkManager.instance.isConnected();

       if(!isConnected) {TFullScreenLoader.stopLoading();return;}

       //Form Validation
       if(!forgetPasswordFormKey.currentState!.validate()){
         TFullScreenLoader.stopLoading();
         return;
       }

       await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

       //Remove Loader
       TFullScreenLoader.stopLoading();

       //Show Sucess Screen
       TLoader.successSnackBar(title: 'Email Sent',message: 'Email Link sent to Reset Your Password'.tr);

       //Redirect
       Get.to(() => ResetPassword(email: email.text.trim(),));
     }
     catch(error){
       TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh snap!',message: error.toString());
     }
   }

   resendPasswordResetEmail(String email)async{
     try{
       //Start Loading
       TFullScreenLoader.openLoadingDialog('Processing your request....', TImages.loading_sing_up_animation);

       //Check Internet Connectivity
       final isConnected = await NetworkManager.instance.isConnected();

       if(!isConnected) {TFullScreenLoader.stopLoading();return;}

       await AuthenticationRepository.instance.sendPasswordResetEmail(email);

       //Remove Loader
       TFullScreenLoader.stopLoading();

       //Show Sucess Screen
       TLoader.successSnackBar(title: 'Email Sent',message: 'Email Link sent to Reset Your Password'.tr);

       //Redirect
     }
     catch(error){
       TFullScreenLoader.stopLoading();
       TLoader.errorSnackBar(title: 'Oh snap!',message: error.toString());
     }
   }
}