import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/user_repositry.dart';
import 'package:e_commerce_app/features/authenticaion/screens/signup/verfity_email.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';

import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  ///Vars
   final hidePassword = true.obs;
   final privacyPolicy = true.obs;
   final email = TextEditingController();
   final password = TextEditingController();
   final firstName = TextEditingController();
   final lastName = TextEditingController();
   final userName = TextEditingController();
   final phoneNumber = TextEditingController();
   GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();





   /// ==Signup
  Future<void> signup()async{
    try{
      //start Loading
      TFullScreenLoader.openLoadingDialog('text', TImages.loading_sing_up_animation);

      //Check Internet Connectivity

      final bool isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy Check
      if(!privacyPolicy.value){
        TLoader.warningSnackBar(title: 'Accept Privacy Policy',
        message: "In Order to create account, you must have to read and accept Privacy Policy & Terms of User");

      return;
      }


      //Register user in Firebase Authentication & save user data  in firebase
      final userCredential =  await AuthenticationRepository.instance.registerWithEmilAndPassword(email.text.trim(), password.text.trim());


      //Save Authenticated user data in Firebase FireStore
       final newUser = UserModel(id: userCredential.user!.uid, firstName: firstName.text.trim(), lastName: lastName.text.trim(), userName: userName.text.trim(), email: email.text.trim(), phoneNumber: phoneNumber.text.trim(), profilePicture: '');
       final userRepository = Get.put(UserRepository());
       await userRepository.storeUserRecord(newUser);
       TFullScreenLoader.stopLoading();
       
      //Show Success Message
      TLoader.successSnackBar(title: 'Congratulation',message: 'Your account has been created! Verify email to continue');

      //Move to Verity Email Screen
        Get.to(() => VerifyEmailScreen(email: userCredential.user?.email));




    }catch(error){
      TLoader.errorSnackBar(title: 'On Snap!',message: error.toString());

    }finally{
      //remove Loader
      TFullScreenLoader.stopLoading();
    }
  }

  hidePasswordPressed(value){
    hidePassword.value != value;
  }
}