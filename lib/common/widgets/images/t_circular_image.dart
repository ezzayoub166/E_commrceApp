import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';

import '../../../utils/constants/consts.dart';

class TCircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height;
  final EdgeInsets padding;

  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = const EdgeInsets.all(TSizes.sm),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor ?? (isDark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(40)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Center(
          child: isNetworkImage ? CachedNetworkImage(imageUrl: image,fit: fit,color: overlayColor,
            progressIndicatorBuilder: (context, url , downloadProgress) => TShimmerEffect(width: 55, height: 55),
            errorWidget: (context, url , error) => Icon(Icons.error) ,
          ) : Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
