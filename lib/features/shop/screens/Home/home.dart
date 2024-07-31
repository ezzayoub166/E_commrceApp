import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
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
                        THomeCategories()
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
                    TPromoSlider(
                      banners: [
                        TImages.banner1,
                        TImages.banner2,
                        TImages.banner3,
                        TImages.banner4,
                        TImages.banner5,
                        TImages.banner6,
                        TImages.banner7,
                        TImages.banner8,
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// --- Heading ---
                    TSectionHeader(title: 'Popular Products'),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// --- Popular Products ---
                    TGridLayout(
                      itemsCount: 4,
                      mainAxisExtent: 288,
                      itemBuilder: (BuildContext, int) {
                        return TProductCardVertical();
                      },
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
