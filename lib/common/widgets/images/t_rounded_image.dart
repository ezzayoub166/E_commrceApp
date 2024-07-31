import 'package:e_commerce_app/utils/constants/consts.dart';

class TRoundedImage extends StatelessWidget {
  final double? height, width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color background;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  const TRoundedImage({
    super.key,
    this.height ,
    this.width ,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.background = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false ,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: background,
            borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: Image(
              image: isNetworkImage ? NetworkImage(imageUrl) :  AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
