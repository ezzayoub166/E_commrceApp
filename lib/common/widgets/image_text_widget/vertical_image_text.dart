import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/constants/consts.dart';
import '../shimmer/shimmer.dart';

class TVerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetWorkImage ;
  final BoxFit fit;
  final Color? overlayColor;

  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor ,
    this.onTap,  this.isNetWorkImage = true,
    this.fit = BoxFit.cover, this.overlayColor,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            ///circular Icon
            Container(
              height: 56,
              width: 56,
              padding: EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (isDark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: isNetWorkImage ? CachedNetworkImage(imageUrl: image,fit: fit,color: overlayColor,
                  progressIndicatorBuilder: (context, url , downloadProgress) => TShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url , error) => Icon(Icons.error) ,
                ) : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
              ),
            ),

            ///Text
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
