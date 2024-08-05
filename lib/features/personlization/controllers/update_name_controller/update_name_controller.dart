import 'package:e_commerce_app/data/repositories/user_repositry.dart';
import 'package:e_commerce_app/features/personlization/controllers/user_controller/user_controller.dart';
import 'package:e_commerce_app/features/personlization/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController{

  static UpdateNameController get instance => Get.find();


  final fName = TextEditingController();
  final lName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> keyForChangeName = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializedNames();

  }

  Future<void> initializedNames()async{
    fName.text = userController.user.value.firstName;
    lName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog("We are updating your information..", TImages.loading_sing_up_animation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){TFullScreenLoader.stopLoading();return;}

      //Form Validation
      if(!keyForChangeName.currentState!.validate()){
        TFullScreenLoader.stopLoading();return;
      }

      //update's user's first Name & Last Name in the Firebase FireStore
       Map<String , dynamic> name = {"firstName":fName.text.trim() , "lastName":lName.text.trim()};
      await UserRepository.instance.updateStringFiled(name);

      //Update the RX in User Controller
      userController.user.value.firstName = fName.text.trim();
      userController.user.value.lastName = lName.text.trim();

      TFullScreenLoader.stopLoading();

      //Show Success Manager
      TLoader.successSnackBar(title: "Configurations",message: "Your Name has been update");

      //Move to previous Screen
      Get.off(() => ProfileScreen());
    }catch(errorMessage){
      TLoader.errorSnackBar(title: "On Snap!",message: errorMessage.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}