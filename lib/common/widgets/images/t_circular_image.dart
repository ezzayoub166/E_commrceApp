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
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
