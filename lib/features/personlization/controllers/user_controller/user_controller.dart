import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/user_repositry.dart';
import 'package:e_commerce_app/features/authenticaion/screens/login/login.dart';
import 'package:e_commerce_app/features/personlization/screens/profile/re_authenticate_user_login_form.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final profileLoading =  false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch User Record
  Future<void> fetchUserRecord()async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;

    }catch(error){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  ///save user Record from any Registration Provider
   Future<void> saveUserRecord(UserCredential? userCredential)async{
    //First update Rx user and then check if user data is already stored . if not store user data.
    await fetchUserRecord();
    //if no record already stored
    if(user.value.id.isEmpty){
      try{
        if(userCredential != null){
          //convert name to First and Last Name
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUserName(userCredential.user!.displayName ?? '');

          //Map Data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join() : '',
              userName: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          await userRepository.storeUserRecord(user);
        }
      }
      catch(e){
        TLoader.warningSnackBar(title: 'Date not saved',
            message: 'Something is Wrong'
        );

      }
    }

   }

   /// Delete Account Warring
   void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: "Delete Account!",
      middleText: "Are you sure want to delete your account permanently ? This Action is not reversible and all of your data will be removed permanently",
      confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: BorderSide(color: Colors.red)),
          onPressed: ()async => deleteUserAccount() , child: Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg),child: Text("Delete"),)),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
       child: Text('Cancel',))
    );
   }
   ///Delete user Account
    void deleteUserAccount() async {
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.loading_sing_up_animation);

      ///First re auth user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        //Re Verify Auth Email
        if(provider == "google.com"){
          await auth.singInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        }else if(provider == 'password'){
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    }catch(errorMessage){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'On Snap!',message: errorMessage.toString());
    }
    }

    /// ---- RE-Authentication before Delete
    Future<void> reAuthenticateEmailAndPassword()async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.loading_sing_up_animation);
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){TFullScreenLoader.stopLoading();return;}

      //Form Validation
      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(verifyEmail.text.trim() , verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    }catch(eMessage){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'On Snap!',message: eMessage.toString());
    }
    }

    uploadUserProfilePicture()async {
    try{

      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
      if(image != null){
        //Upload image
        imageUploading.value = true;
        final imageURl = await UserRepository.instance.uploadImage('Users/images/Profile/', image);
        //Update User Image Record
        Map<String,dynamic> json = {"profilePicture":imageURl};
        await userRepository.updateStringFiled(json);
        user.value.profilePicture = imageURl;
        user.refresh();
        TLoader.successSnackBar(title: 'Configurations',message: 'Your Profile Image has been updated!');

      }
    }
    catch(errorM){
      TLoader.errorSnackBar(title: 'On Snap!',message: "Some thing wrong: $errorM");

    }finally{
      imageUploading.value = false;
    }

    }
}