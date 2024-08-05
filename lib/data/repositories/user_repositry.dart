
import 'dart:io';

import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class UserRepository extends GetxController{

  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final String collectionNameUsers = 'Users';

  final _currentAuthUser = AuthenticationRepository.instance.authUser;


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

   ///Function to fetch user details based on user ID

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection(collectionNameUsers).doc(_currentAuthUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  ///Function to update user Data in FireStore
  Future<void> updateUserDetails(UserModel updateUser)async {
    try {
      await _db.collection(collectionNameUsers).doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  ///Function to update any filed in Specific users Collection
  Future<void> updateStringFiled(Map<String , dynamic> json)async {
    try {
      await _db.collection(collectionNameUsers).doc(_currentAuthUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  ///Function to update user Data in fireStore
  Future<void> removeUserRecord(String userID)async {
    try {
      await _db.collection(collectionNameUsers).doc(userID).delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  ///Upload any image
   Future<String> uploadImage(String path , XFile image)async{
      try {
        final ref = FirebaseStorage.instance.ref(path).child(image.name);
        await ref.putFile(File(image.path));
        final url = await ref.getDownloadURL(); // use this url to display this image ..
        return url;
     } on FirebaseAuthException catch (e) {
       throw TFirebaseAuthException(e.code).message;
     } on FirebaseException catch (e) {
       throw TFirebaseException(e.code).message;
     } on FormatException catch (_) {
       throw TFormatException();
     } on PlatformException catch (e) {
       throw TPlatformException(e.code).message;
     } catch (e) {
       throw 'something went wrong. Please try again';
     }
   }



}