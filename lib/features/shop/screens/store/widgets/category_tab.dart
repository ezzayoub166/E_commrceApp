import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/consts.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Brands
              TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ],
              ),

              TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              /// --- Products
              TSectionHeader(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(itemsCount: 4, itemBuilder: (_,index){
                return TProductCardVertical();
              }),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
