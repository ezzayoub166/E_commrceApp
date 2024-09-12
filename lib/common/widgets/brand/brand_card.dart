import '../../../utils/constants/consts.dart';
import '../../../utils/constants/enums.dart';
import '../custom_shapes/containers/rounder_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    
    super.key, required this.showBorder, this.onTap, required this.brandModel,
  });

  final bool showBorder ;
  final void Function()? onTap ;
  final BrandModel brandModel;

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
              image: brandModel.image,
              isNetworkImage: true,
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
                    title: brandModel.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brandModel.productCont ?? 0 }products',
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
