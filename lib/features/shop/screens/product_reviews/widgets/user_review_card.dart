import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/rating/rating_indicator.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
                SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Dor',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        /// Reviews
        Row(
          children: [
            TRatingBarIndicator(rating: 4.0),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov ,2032',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText('Thr User interface of app is quite intvitive . I was able to navigate and make purchess seamlessy. Great job',
        trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold , color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
         ///Company Reviews
        TRounderContainer(
          backgroundColor: isDark ? TColors.darkGrey : TColors.grey,
          child: Padding(padding: EdgeInsets.all(TSizes.md),child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('T Store ' ,style: Theme.of(context).textTheme.titleMedium,),
                  Text('02 Nov , 2023',style: Theme.of(context).textTheme.bodyMedium,)

                ],
              ),
                SizedBox(height: TSizes.spaceBtwItems,),
                ReadMoreText('Thr User interface of app is quite intvitive . I was able to navigate and make purchess seamlessy. Great job',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold , color: TColors.primary),
                ),
            ],
          ),),
        ),
        SizedBox(height: TSizes.spaceBtwSections,)



      ],
    );
  }
}
