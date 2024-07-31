import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & sale Price
        Row(
          children: [
            ///Sale Tag
            TRounderContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm , vertical: TSizes.xs),
              child: Text('25%' , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            ///Price
            Text('\$250' ,style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: '175',isLarge: true, )

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems /1.5 ),

        ///Title
        TProductTitleText(title: 'Green Nike Sport Shirt'),
        SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        ///Stock Status
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('In Stock' , style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5,),
        ///Brand
        Row(
          children: [
            TCircularImage(
                image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
            
          ],
        )

      ],
    );
  }
}
