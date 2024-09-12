import 'dart:io';

import 'package:e_commerce_app/firebase_storage_service.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:firebase_core/firebase_core.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  ///Variblase
  final _db = FirebaseFirestore.instance;
  final isLoading = false.obs;

  //Get all Categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      return snapshot.docs
          .map((documentSnapshot) => BrandModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. while Fetching Banners';
    }
  }

  //Get Brand For Category

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      isLoading.value = true;
      final storage = Get.put(TFirebaseStorageService());
      for (var brand in brands) {
        final brandImage = await storage.getImageDataFromAssets(brand.image);
        //upload image and get its url..
        final url = await storage.uploadImageData(
            'Brands/Images', brandImage, brand.name);

        //assign url to image
        brand.image = url;
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
        isLoading.value = false;
      }
    } on FirebaseException catch (errorMessage) {
      throw errorMessage.message!;
    } on SocketException catch (errorMessage) {
      throw errorMessage.message;
    } on PlatformException catch (errorMessage) {
      throw errorMessage.message!;
    } catch (e) {
      throw e.toString();
    }finally{
              isLoading.value = false;

    }
  }
}
