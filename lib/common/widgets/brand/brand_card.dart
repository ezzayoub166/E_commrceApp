import '../../../utils/constants/consts.dart';
import '../../../utils/constants/enums.dart';
import '../custom_shapes/containers/rounder_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder ;
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRounderContainer(
        padding: EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            TCircularImage(
              image: TImages.clothIcon,
              isNetworkImage: false,
              backgroundColor: Colors.transparent,
              overlayColor: isDark ? TColors.white : TColors.black,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            ///Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products with Tow Sizes',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
