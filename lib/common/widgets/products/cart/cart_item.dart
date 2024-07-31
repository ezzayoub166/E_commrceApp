import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(
          imageUrl: TImages.productImage3,
          height: 60,
          width: 60,
          padding: EdgeInsets.all(TSizes.sm),
          background: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.grey,
        ),
        SizedBox(width: TSizes.spaceBtwSections,),
        ///Title and size and price,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleTextWithVerifiedIcon(title: 'Nike' , maxLines: 1,),
              // SizedBox(height: TSizes.spaceBtwItems,),
              TProductTitleText(title: 'Black sports shose ' ,maxLines: 1,),
              ///Atributes
              Text.rich(
                  TextSpan(children:
                  [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green ',style: Theme.of(context).textTheme.bodyLarge),

                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 08 ',style: Theme.of(context).textTheme.bodyLarge),
                  ]
                  ))
            ],
          ),
        )
      ],
    );
  }
}
