import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/enum/enums.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.scalePrice);
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
              child: Text('$salePercentage%' , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            ///Price
            if(product.productType == 'single' && product.scalePrice > 0)
              Text('\$${product.price}' ,style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == 'single' && product.scalePrice > 0) SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: controller.getProductPrice(product),isLarge: true, )

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems /1.5 ),

        ///Title
        TProductTitleText(title: product.title),
        SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        ///Stock Status
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5,),
        ///Brand
        Row(
          children: [
            TCircularImage(
                image: product.brandModel != null ? product.brandModel!.image : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
              width: 32,
              height: 32,
              isNetworkImage: false,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleTextWithVerifiedIcon(title: product.brandModel != null ? product.brandModel!.name : ''),
            
          ],
        )

      ],
    );
  }
}
