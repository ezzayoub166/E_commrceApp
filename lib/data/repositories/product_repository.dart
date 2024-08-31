import 'dart:io';

import 'package:e_commerce_app/firebase_storage_service.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/enum/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  //Get Limited featured products
  Future<List<ProductModel>> getFeaturedProducts()async{
    try {
      final snapshot = await _db.collection('Products').where(
          'IsFeatured', isEqualTo: true).limit(4).get();
      List<ProductModel> products = snapshot.docs.map((doc) {
        return ProductModel.fromSnapshot(doc);
      }).toList();

      return products;
    }catch(error){
     rethrow;
      return [];
    }

    // }on FirebaseException catch(error){
    //   throw TFirebaseException(error.code).message;
    // }on PlatformException catch(error){
    //   throw TFirebaseException(error.code).message;
    // }finally{
    //   throw 'Somethings went wrong , Please try again';
    // }
  }

  ///Upload dummy Data to Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      //Loop
      for (var product in products) {
        final thumbnail =  await storage.getImageDataFromAssets(product.thumbnail);

        //upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail);

        //Assign url to product.thumbnail attribute
        product.thumbnail = url;

        //products list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            //Get images data link from local assets
            final assetsImage = await storage.getImageDataFromAssets(image);

            //upload image to get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetsImage, image);
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //upload Variation Images
        if(product.productType == ProductType.variable.toString()){
          for (var variation in product.productVariation!) {
            //get image data link from local asset
            final imagesAsset =
            await storage.getImageDataFromAssets(variation.image);

            //upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', imagesAsset, variation.image);

            variation.image = url;
          }
        }
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (errorMessage) {
      throw errorMessage.message!;
    } on SocketException catch (errorMessage) {
      throw errorMessage.message;
    } on PlatformException catch (errorMessage) {
      throw errorMessage.message!;
    } catch (e) {
      throw e.toString();
    } finally {


    }
  }
}
