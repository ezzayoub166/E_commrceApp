import 'package:e_commerce_app/data/repositories/user_repositry.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

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