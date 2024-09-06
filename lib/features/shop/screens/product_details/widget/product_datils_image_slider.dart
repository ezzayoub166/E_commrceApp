import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:extended_image/extended_image.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/icon/t_cricular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/consts.dart';
//
// class TProductImageSlider extends StatelessWidget {
//   const TProductImageSlider({
//     super.key,
//     required this.product,
//   });
//
//   final ProductModel product;
//
//  static bool stringHasValue(String? input) {
//     return input != null && input.isNotEmpty;
//   }
//
//   static bool validateURL(String? input) {
//     if (stringHasValue(input)) {
//       return Uri.parse(input!).host.isNotEmpty;
//     } else {
//       return false;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark = THelperFunctions.isDarkMode(context);
//     final controller = Get.put(ImagesController());
//     final images = controller.getAllProductImages(product);
//
//     return TCurvedEdgeWidget(
//       child: Container(
//         color: isDark ? TColors.darkGrey : TColors.light,
//         child: Stack(
//           children: [
//             ///Main Large Image
//             SizedBox(
//                 height: 400,
//                 child: Padding(
//                   padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
//                   child: Center(
//                       child: Obx((){
//                            final selectedImage = controller.selectedProductImage.value;
//                            final imageUrl = Uri.parse(controller.selectedProductImage.value).isAbsolute ? selectedImage : null;
//                            if(imageUrl == null || imageUrl.isEmpty){
//                              return Image.asset('assets/images/error404.png',fit: BoxFit.cover,);
//                            }
//                            return GestureDetector(
//                              onTap: (){
//                                controller.showEnlargedImage(selectedImage);
//                              },
//                              child: ExtendedImage.network(
//                                  imageUrl ,
//                                  cache: true,
//                                  loadStateChanged: (ExtendedImageState state) {
//                                    switch (state.extendedImageLoadState) {
//                                      case LoadState.loading:
//                                        return const CircularProgressIndicator.adaptive();
//                                      case LoadState.completed:
//                                        return state.completedWidget;
//                                      case LoadState.failed:
//                                        return Text("Error");
//                                    }
//                                  }
//                              ),
//                            );
//
//                           return CachedNetworkImage(
//                             imageUrl: Uri.parse(controller.selectedProductImage.value ?? "").hasAbsolutePath ? selectedImage : 'https://via.placeholder.com/150', // Fallback to a placeholder image if the URL is empty
//                             progressIndicatorBuilder: (_,__,downloadProgress) =>
//                             CircularProgressIndicator(value: downloadProgress.progress,color: TColors.primary),
//                               errorWidget: (_, __, ___) => Icon(Icons.error, color: Colors.red), // Display error icon on failure
//                           );
//                       }),
//                 ))),
//
//             /// Image Slider
//             Positioned(
//               right: 0,
//               bottom: 30,
//               left: TSizes.defaultSpace,
//               child: SizedBox(
//                 height: 80,
//                 child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     itemBuilder: (_, index) =>
//                       Obx(() {
//                         final imageSelected = controller.selectedProductImage.value == images[index];
//                         return TRoundedImage(
//                             width: 80,
//                             isNetworkImage: true,
//                             background: isDark ? TColors.dark : TColors.white,
//                             border: Border.all(color: imageSelected ?  TColors.primary : Colors.transparent,width: 2),
//                             onPressed: () => controller.selectedProductImage.value = images[index],
//                             padding: EdgeInsets.all(TSizes.sm),
//                             imageUrl: images[index]
//                         );
//                       })
//                     ,
//                     separatorBuilder: (__, index) {
//                       return SizedBox(
//                         width: TSizes.spaceBtwItems,
//                       );
//                     },
//                     itemCount: images.length),
//               ),
//             ),
//             TAppBar(
//               showBackArrow: true,
//               actions: [
//                 TCircularIcon(
//                   icon: Iconsax.heart,
//                   color: Colors.red,
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  static bool stringHasValue(String? input) {
    return input != null && input.isNotEmpty;
  }

  static bool validateURL(String? input) {
    if (stringHasValue(input)) {
      return Uri.parse(input!).hasAbsolutePath;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);



    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final selectedImage = controller.selectedProductImage.value;
                    const notFoundImage = 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';
                    final imageUrl = validateURL(selectedImage) ? selectedImage : notFoundImage;

                    return GestureDetector(
                      onTap: () {
                        controller.showEnlargedImage(selectedImage);
                      },
                      // child: Image.network(imageUrl),
                      child: ExtendedImage.network(
                        imageUrl,
                        cache: true,
                        loadStateChanged: (ExtendedImageState state) {
                          switch (state.extendedImageLoadState) {
                            case LoadState.loading:
                              return const CircularProgressIndicator.adaptive();
                            case LoadState.completed:
                              return state.completedWidget;
                            case LoadState.failed:
                              return Image.asset(
                                'assets/images/error404.png',
                                fit: BoxFit.cover,
                              );
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Obx(() {
                    // final imageSelected = controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      background: isDark ? TColors.dark : TColors.white,
                      border: Border.all(
                        color: controller.selectedProductImage.value == images[index] ? TColors.primary : Colors.transparent,
                        width: 2,
                      ),
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      padding: EdgeInsets.all(TSizes.sm),
                      imageUrl: images[index],
                    );
                  }),
                  separatorBuilder: (__, index) {
                    return SizedBox(
                      width: TSizes.spaceBtwItems,
                    );
                  },
                  itemCount: images.length ,
                ),
              ),
            ),
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


