import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../common/widgets/rating/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: TAppBar(title: Text('Reviews & Rating'),showBackArrow: true,),
      /// Body
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and reviews are verified and are from people who use the same type device that you user',
              ),
              SizedBox(height: TSizes.spaceBtwItems,),
              ///Overall Product Ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text("12.611",style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: TSizes.spaceBtwSections,),

              ///User Reviews List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),


            ],
          ) ,),

      ),
    );
  }
}




