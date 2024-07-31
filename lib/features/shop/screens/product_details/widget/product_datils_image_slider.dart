import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/icon/t_cricular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/consts.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
                height: 400
                ,child: Padding(
              padding: const EdgeInsets.all(TSizes.productImageRadius * 2 ),
              child: Center(child: Image(image: AssetImage(TImages.productImage3))),
            )),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (_,index){
                      return TRoundedImage(
                          width: 80,
                          background: isDark ? TColors.dark : TColors.light,
                          border: Border.all(color: TColors.primary),
                          padding: EdgeInsets.all(TSizes.sm),
                          imageUrl: TImages.productImage3);
                    }, separatorBuilder: (__, index){
                  return SizedBox(width: TSizes.spaceBtwItems,);
                }, itemCount: 4),
              ),
            ),
            TAppBar(
              showBackArrow: true,
              actions: [TCircularIcon(icon: Iconsax.heart , color: Colors.red,)],
            )



          ],
        ),
      ),
    );
  }
}
