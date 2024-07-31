import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/prodcut_detail.dart';

import '../../../../utils/constants/consts.dart';
import '../../icon/t_cricular_icon.dart';
import '../../texts/product_price.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails());
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
                  TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
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
                        '25%',
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
                    title: 'Green Nike Air Shoose',
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleTextWithVerifiedIcon(title: 'Nike')
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
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: '35.0',),
                ),
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

