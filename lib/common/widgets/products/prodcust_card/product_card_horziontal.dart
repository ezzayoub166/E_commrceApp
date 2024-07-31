import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/icon/t_cricular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';

import '../../../../utils/constants/consts.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: isDark ? TColors.darkGrey : TColors.softGrey),
      child: Row(
        children: [

          ///Thumbnial
          TRounderContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: isDark  ?  TColors.dark : TColors.light,
            child: Stack(
              children: [
                ///Theme image
                SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImages.productImage3 , applyImageRadius: true ,)),
                ///Sale Tage
                Positioned(
                    top: 12,
                    child: TRounderContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  padding: EdgeInsets.symmetric(horizontal:TSizes.sm ,vertical: TSizes.xs),
                  child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                )),
                ///Favaioutr icon
                Positioned(
                  top: 0 ,
                  right : 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                )

              ],
            ),
          ),
          ///Details
          SizedBox(
            width: 172,
            child:Padding(
              padding: const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: 'Green Nike Green Nike' , smallSize: true,),
                        SizedBox(height: TSizes.spaceBtwItems/2,),
                        TBrandTitleTextWithVerifiedIcon(title: 'Nike')
                      ],
                    ),
                  SizedBox(height: TSizes.spaceBtwItems/2,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TProductPriceText(price: '256.0')),
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
          )
        ],
      ) ,

    );
  }
}
