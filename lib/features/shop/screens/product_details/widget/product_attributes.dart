import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';

import '../../../../../utils/constants/consts.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// selected attributes Pricing & Descreption
        TRounderContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? TColors.darkGrey :TColors.grey ,
          child: Column(
            children: [
              ///Title price & Stock status
              Row(
                children: [
                  TSectionHeader(title: 'Variation'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Price' , smallSize: true,),
                      Row(
                        children: [
                          ///Actual price
                          Text('\$25' , style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          SizedBox(width: TSizes.spaceBtwItems,),
                          ///Sale Price
                          TProductPriceText(price: '20')
                        ],
                      ),
                      ///Stack
                      Row(
                        children: [
                          TProductTitleText(title: 'Stock' , smallSize: true,),
                          Text('In Stock' , style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  )
                ],
              ),
              /// Variation Descreption
              TProductTitleText(
                  title: 'This is the Description of the product and it can go up to max 4 times',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        /// Attributes
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeader(title: 'Colors' , showActionButton: false,),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true , onSelected: (value){},),
                TChoiceChip(text: 'Yellow', selected: false , onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: false , onSelected: (value){},),
                TChoiceChip(text: 'Red', selected: false , onSelected: (value){},),
                TChoiceChip(text: 'Green', selected: false , onSelected: (value){},),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeader(title: 'Sizes' , showActionButton: false,),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true , onSelected: (value){},),
                TChoiceChip(text: 'EU 56', selected: false , onSelected: (value){},),
                TChoiceChip(text: 'Eu 99', selected: false , onSelected: (value){},),
                TChoiceChip(text: 'Eu 33', selected: false , onSelected: (value){},),
                TChoiceChip(text: 'Eu 22', selected: false , onSelected: (value){},),
              ],
            )
          ],
        ),

      ],
    );
  }
}
