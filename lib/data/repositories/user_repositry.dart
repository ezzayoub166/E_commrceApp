
import 'package:e_commerce_app/utils/constants/consts.dart';


class UserRepository extends GetxController{

  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final String collectionNameUsers = 'Users';

  ///Function to save user data to fireStore

   Future<void> storeUserRecord(UserModel user)async {
     try{
       await _db.collection(collectionNameUsers).doc(user.id).set(user.toJson());
     }on FirebaseAuthException catch (e){
       throw TFirebaseAuthException(e.code).message;
     }on FirebaseException catch (e){
       throw TFirebaseException(e.code).message;
     }on FormatException catch (_){
       throw TFormatException();
     }on PlatformException catch (e){
       throw TPlatformException(e.code).message;
     }catch(e){
       throw 'something went wrong. Please try again';
     }

   }

}