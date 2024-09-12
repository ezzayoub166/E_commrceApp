import 'dart:io';

import 'package:e_commerce_app/firebase_storage_service.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/enum/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  var isLoading = false.obs; // Observable loading state

  //Get Limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      List<ProductModel> products = snapshot.docs.map((doc) {
        return ProductModel.fromSnapshot(doc);
      }).toList();

      return products;
    } on FirebaseException catch (error) {
      throw TFirebaseException(error.code).message;
    } on PlatformException catch (error) {
      throw TFirebaseException(error.code).message;
    } catch (e) {
      throw 'something went wrong. while Fetching Banners';
    }

    // }on FirebaseException catch(error){
    //   throw TFirebaseException(error.code).message;
    // }on PlatformException catch(error){
    //   throw TFirebaseException(error.code).message;
    // }finally{
    //   throw 'Somethings went wrong , Please try again';
    // }
  }

  //Get Limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final querySnapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (error) {
      throw TFirebaseException(error.code).message;
    } on PlatformException catch (error) {
      throw TFirebaseException(error.code).message;
    } catch (e) {
      throw 'something went wrong. while Fetching Banners';
    }
  }

  //Get Products based on brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productsList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productsList;
    } on FirebaseException catch (error) {
      throw TFirebaseException(error.code).message;
    } on PlatformException catch (error) {
      throw TFirebaseException(error.code).message;
    } catch (e) {
      throw 'something went wrong. while Fetching Banners';
    }

    // }on FirebaseException catch(error){
    //   throw TFirebaseException(error.code).message;
    // }on PlatformException catch(error){
    //   throw TFirebaseException(error.code).message;
    // }finally{
    //   throw 'Somethings went wrong , Please try again';
    // }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String BrnadID, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection("Products")
              .where("BrandModel.ID", isEqualTo: BrnadID)
              .get()
          : await _db
              .collection("Products")
              .where("BrandModel.ID", isEqualTo: BrnadID)
              .limit(limit)
              .get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (error) {
      throw TFirebaseException(error.code).message;
    } on PlatformException catch (error) {
      throw TFirebaseException(error.code).message;
    } catch (e) {
      throw 'Somethings went wrong , Please try again';
    }
  }

  Future<void> uploadOne(ProductModel product) async {
    try {
      isLoading.value = true;
      final storage = Get.put(TFirebaseStorageService());

      // Upload thumbnail image
      final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
      final thumbnailUrl = await storage.uploadImageData(
          'Products/Images', thumbnail, product.thumbnail);
      product.thumbnail = thumbnailUrl;

      // Upload product images in parallel (if any)
      if (product.images != null && product.images!.isNotEmpty) {
        final List<Future<String>> uploadFutures =
            product.images!.map((image) async {
          final assetsImage = await storage.getImageDataFromAssets(image);
          return await storage.uploadImageData(
              'Products/Images', assetsImage, image);
        }).toList();

        final imagesUrls = await Future.wait(uploadFutures);
        product.images!.clear();
        product.images!.addAll(imagesUrls);
      }

      // Upload variation images (if product type is variable)
      if (product.productType == ProductType.variable.toString()) {
        final List<Future<void>> variationFutures =
            product.productVariation!.map((variation) async {
          final variationImage =
              await storage.getImageDataFromAssets(variation.image);
          final variationImageUrl = await storage.uploadImageData(
              'Products/Images', variationImage, variation.image);
          variation.image = variationImageUrl;
        }).toList();

        // Wait for all variations to finish uploading
        await Future.wait(variationFutures);
      }

      // Upload product data to Firestore
      await _db.collection('Products').doc(product.id).set(product.toJson());
    } on FirebaseException catch (errorMessage) {
      throw errorMessage.message!;
    } on SocketException catch (errorMessage) {
      throw errorMessage.message;
    } on PlatformException catch (errorMessage) {
      throw errorMessage.message!;
    } catch (e) {
      throw e.toString();
    } finally {
      isLoading.value = false; // Stop loading
      TLoader.errorSnackBar(
          title: 'UPLOAD DONE', message: "${product.title} is uploaded");
    }
  }

  //Upload object by object
  // Future<void> uploadOne(ProductModel product)async{
  //
  //   try{
  //     isLoading.value = true;
  //     final storage = Get.put(TFirebaseStorageService());
  //     final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
  //     //upload Image and get its url
  //     final url = await storage.uploadImageData('Products/Images', thumbnail , product.thumbnail);
  //     product.thumbnail = url;
  //
  //     //products list of images
  //     if (product.images != null && product.images!.isNotEmpty) {
  //       List<String> imagesUrl = [];
  //       for (var image in product.images!) {
  //         //Get images data link from local assets
  //         final assetsImage = await storage.getImageDataFromAssets(image);
  //
  //         //upload image to get its url
  //         final url = await storage.uploadImageData(
  //             'Products/Images', assetsImage, image);
  //         imagesUrl.add(url);
  //       }
  //       product.images!.clear();
  //       product.images!.addAll(imagesUrl);
  //     }
  //
  //     //upload Variation Images
  //     if(product.productType == ProductType.variable.toString()){
  //       for (var variation in product.productVariation!) {
  //         //get image data link from local asset
  //         final imagesAsset =
  //         await storage.getImageDataFromAssets(variation.image);
  //
  //         //upload image and get its url
  //         final url = await storage.uploadImageData(
  //             'Products/Images', imagesAsset, variation.image);
  //
  //         variation.image = url;
  //       }
  //     }
  //     await _db.collection('Products').doc(product.id).set(product.toJson());
  //     isLoading.value = false;
  //
  //
  //
  //   }on FirebaseException catch (errorMessage) {
  //   throw errorMessage.message!;
  //   } on SocketException catch (errorMessage) {
  //   throw errorMessage.message;
  //   } on PlatformException catch (errorMessage) {
  //   throw errorMessage.message!;
  //   } catch (e) {
  //   throw e.toString();
  //   } finally {
  //     isLoading.value = false; // Stop loading
  //     TLoader.errorSnackBar(title: 'UPLOAD DONE',message: "${product.title} is upload");
  //   }
  // }

  ///Upload dummy Data to Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    isLoading.value = true; // Start loading

    try {
      final storage = Get.put(TFirebaseStorageService());

      //Loop
      for (var product in products) {
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

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
        if (product.productType == ProductType.variable.toString()) {
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
      isLoading.value = false; // Stop loading
    }
  }
}
