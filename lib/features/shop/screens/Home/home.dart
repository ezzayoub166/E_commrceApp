import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/product_controller.dart';
import 'package:e_commerce_app/features/shop/screens/Home/widgets/promo_slider.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Search Bar
                  TSearchContainer(
                    text: "Search in store",
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// ---Catetgories---
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///---Heading---
                        TSectionHeader(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                          onPressed: (){Get.to(() => AllProductsScreen());},
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///---Categories---
                        THomeCategories(),
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),


            /// ---Body---
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    TPromoSlider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// --- Heading ---
                    TSectionHeader(title: 'Popular Products'),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// --- Popular Products ---
                    Obx(
                      (){
                        // print(controller.featuredProducts);
                        if (controller.isLoading.value) return TVerticalProductShimmer();
                        if(controller.featuredProducts.isEmpty){
                          return Center(child: Text('No Data Found!',style:Theme.of(context).textTheme.bodyMedium));
                        }
                        return TGridLayout(
                          itemsCount: controller.featuredProducts.length,
                          mainAxisExtent: 288,
                          itemBuilder: (_, int index) {
                            return TProductCardVertical(product: controller.featuredProducts[index],);
                          },
                        );
                      } ,
                    ),
                    /// --- Popular Products ---
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
