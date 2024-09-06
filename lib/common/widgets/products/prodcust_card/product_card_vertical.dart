import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/prodcut_detail.dart';
import 'package:e_commerce_app/utils/enum/enums.dart';

import '../../../../utils/constants/consts.dart';
import '../../icon/t_cricular_icon.dart';
import '../../texts/product_price.dart';

class TProductCardVertical extends StatelessWidget {
  final ProductModel product;
  const TProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.scalePrice);
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(
              product: product,
            ));
      },
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: isDark ? TColors.darkGrey : TColors.white),
        child: Column(
          children: [
            ///Thumbial , Wishlist , Button
            TRounderContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: TRounderContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),

            /// -- Deatils
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleTextWithVerifiedIcon(
                      title: product.brandModel?.name ?? '')
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Nike',
                  //       overflow: TextOverflow.ellipsis,
                  //       maxLines: 1,
                  //       style: Theme.of(context).textTheme.labelMedium,
                  //     ),
                  //     SizedBox(height: TSizes.xs),
                  //     Icon(
                  //       Iconsax.verify5,
                  //       color: TColors.primary,
                  //       size: TSizes.iconXs,
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
            Spacer(),

            /// --- Price ٌRow ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Column(children: [
                  if (product.productType == ProductType.single.toString() &&
                      product.scalePrice! > 0)
                    Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        )),

                      Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: TProductPriceText(price: controller.getProductPrice(product))),
                ])),

                /// --- Add to Cart Button ---
                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(TSizes.productImageRadius)),
                  ),
                  child: SizedBox(
                      height: TSizes.iconLg * 1.2,
                      width: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
