import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/consts.dart';

class CategoryTab extends StatelessWidget {

  final CategoryModel category;
  const CategoryTab({super.key, required this.category});

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
              TGridLayout(itemsCount: 0, itemBuilder: (_,index){
                return TProductCardVertical(product: ProductModel.empty(),);
              }),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
