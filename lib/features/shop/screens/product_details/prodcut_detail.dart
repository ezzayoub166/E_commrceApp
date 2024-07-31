import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icon/t_cricular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/bottom_add_to_cart_widget.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/product_datils_image_slider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            TProductImageSlider(),

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
                  TProductMetaData(),
                  /// Attributes
                  TProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections,),
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
                      'This is product , very like it , and i hope choose the coloe and size and sure to review it , thank you very much , so we can do it and maybe some one , yes yes , yes , plase call me on the number phone and dont forget this'

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

