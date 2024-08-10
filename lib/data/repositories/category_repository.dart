import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/firebase_storage_service.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories()async {
    try {
      //we will receive some snapshot from the fire store
    final snapshot = await _db.collection('Categories').get();
    final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
    return list;
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
  ///Get sub Categories
  ///Upload Categories to cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories)async {
    try {
      //upload all categories along with their images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for(var category in categories){
        //Get Image data link form the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        //upload image and Get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        //Assign URL to Category.image attribute
        category.image = url;
        //store category in firebase
        await _db.collection('Categories').doc(category.id).set(category.toJson());

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

}