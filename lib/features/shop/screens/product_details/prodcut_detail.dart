
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/bottom_add_to_cart_widget.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/product_datils_image_slider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            TProductImageSlider(product: product,),

            /// product Details
            Padding(
                padding: EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  TRatingAndShare(),
                  /// Price, Title , Stock , Brand
                  TProductMetaData(product: product,),
                  /// Attributes
                  if(product.productType == 'variable') TProductAttributes(product: product,),
                  if(product.productType == 'variable') SizedBox(height: TSizes.spaceBtwSections,),
                  /// Check out button
                  SizedBox(width: double.infinity , child: ElevatedButton(onPressed: (){}, child: Text('Check out'))),
                  /// Descreption
                  TSectionHeader(title: 'Description'),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  ReadMoreText(
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'less',
                      trimLines: 2,
                      moreStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.w800),
                      lessStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.w800),
                      product.description ?? ''
                  ),

                  /// Reviwes
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeader(title: 'Reviews(199)',onPressed: (){

                      },showActionButton: false,),
                      IconButton(onPressed: (){
                        Get.to(() => ProductReviewsScreen());
                      }, icon: Icon(Iconsax.arrow_right_3 , size: 18,))
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

