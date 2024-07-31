import '../../../features/shop/screens/store/store.dart';
import '../../../utils/constants/consts.dart';
import '../custom_shapes/containers/rounder_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images,
  });

  final List<String> images ;


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return TRounderContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          ///Brand with Product Count
          TBrandCard(showBorder: true,),
          SizedBox(height: TSizes.spaceBtwItems),
          ///Brand Top 3 Prodcts Image
          Row(
            children: images.map((image) => brandTopProductImageWidget(image: image,context: context)).toList(),
          )



          ///
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget({required String image, context}) {
    return Expanded(
      child: TRounderContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
        margin: EdgeInsets.only(right: TSizes.sm),
        padding: EdgeInsets.all(TSizes.md),
        child: Image(image: AssetImage(image) , fit: BoxFit.contain,),
      ),
    );
  }
}