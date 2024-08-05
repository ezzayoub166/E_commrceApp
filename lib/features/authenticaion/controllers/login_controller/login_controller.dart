import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/personlization/controllers/user_controller/user_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  ///variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());
  
  
  
  @override
  void onInit() {
    // TODO: implement onInit
    localStorage.writeIfNull('REMEMBER_ME_EMAIL', '');
    localStorage.writeIfNull('REMEMBER_ME_PASSWORD', '');

    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  }
  
  
  Future<void> emailAndPasswordSignIn()async{
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging In', TImages.loading_sing_up_animation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //save Data if Remember me is Selectedx
      if(rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

        //Login user suing Email & Password Authentication
         await AuthenticationRepository.instance.loginWithEmilAndPassword(email.text.trim(), password.text);

        //Remove Loader
        TFullScreenLoader.stopLoading();

        //Redirect Loader
        AuthenticationRepository.instance.screenRedirect();


      }
    catch(error){
       TFullScreenLoader.stopLoading();
       TLoader.errorSnackBar(title: "Oh Snap!",message: error.toString());
    }
  }

  Future<void> googleSignIn()async{
    //start Loading
    TFullScreenLoader.openLoadingDialog('Logging In', TImages.loading_sing_up_animation);

    final isConnected = await NetworkManager.instance.isConnected();

    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }

    //Google Authentication
    final userCredential = await AuthenticationRepository.instance.singInWithGoogle();

    //save User Data
    await userController.saveUserRecord(userCredential);

    //Remove Loader
    TFullScreenLoader.stopLoading();

    //Redirect
    AuthenticationRepository.instance.screenRedirect();



  }


}