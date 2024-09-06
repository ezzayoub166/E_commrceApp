import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png".obs;


  List<String> getAllProductImages(ProductModel  product){

    Set<String> images = {};
    
    images.add(product.thumbnail);

    selectedProductImage.value = product.thumbnail;

    if(product.images != null){
      images.assignAll(product.images!);
    }

    ///Get all images from the product variations if not null
    if(product.productVariation != null || product.productVariation!.isNotEmpty){
      print(images);
      images.addAll(product.productVariation!.map((variation) => variation.image));
    }

    return images.toList();


    
  }

  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
        () => Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2 , horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
              ),
              SizedBox(height: TSizes.spaceBtwSections,),
              Align(
                alignment:Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: () => Get.back(), child: Text('Close')),
                ),
              )
            ],
          ),
        )
    );
  }
}