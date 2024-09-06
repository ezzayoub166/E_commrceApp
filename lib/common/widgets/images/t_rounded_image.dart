import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:extended_image/extended_image.dart';

import '../../../features/shop/screens/product_details/widget/product_datils_image_slider.dart';

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
    this.height,
    this.width,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.background = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = true,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  @override
  Widget build(BuildContext context) {
    // final validImageUrl = TProductImageSlider.validateURL(imageUrl) ? imageUrl : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';

    // Check if imageUrl is valid, otherwise use a fallback placeholder
    final validImageUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath == true
        ? imageUrl
        : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';

    if (!Uri.parse(imageUrl).isAbsolute || imageUrl.isEmpty) {
      print('Invalid image URL: $imageUrl');
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: background,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child:
          // Image.network(validImageUrl)

          isNetworkImage  ? ExtendedImage.network(
            validImageUrl,
            cache: true,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return const CircularProgressIndicator.adaptive();
                case LoadState.completed:
                  return state.completedWidget;
                case LoadState.failed:
                  return Icon(
                    Icons.error,
                    color: Colors.red,
                  );
              }
            },
          ): Image.asset(imageUrl),
        ),
      ),
    );
  }
}


// class TRoundedImage extends StatelessWidget {
//   final double? height, width;
//   final String imageUrl;
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final Color background;
//   final BoxFit fit;
//   final EdgeInsetsGeometry? padding;
//   final bool isNetworkImage;
//   final VoidCallback? onPressed;
//   final double borderRadius;
//
//   const TRoundedImage({
//     super.key,
//     this.height ,
//     this.width ,
//     required this.imageUrl,
//     this.applyImageRadius = true,
//     this.border,
//     this.background = TColors.light,
//     this.fit = BoxFit.contain,
//     this.padding,
//     this.isNetworkImage = false ,
//     this.onPressed,
//     this.borderRadius = TSizes.md,
//   });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final imageUrlDownload = Uri.parse(imageUrl).isAbsolute ? imageUrl : "" ;
//
//
//     // ImageProvider imageProvider;
//     //
//     // // if (isNetworkImage) {
//     // //   imageProvider = NetworkImage(imageUrl);
//     // // } else {
//     // //   imageProvider = AssetImage(imageUrl);
//     // // }
//
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         decoration: BoxDecoration(
//             border: border,
//             color: background,
//             borderRadius: BorderRadius.circular(borderRadius)
//         ),
//         child: ClipRRect(
//           borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
//           child: ExtendedImage.network(imageUrlDownload ,
//               cache: true,
//               loadStateChanged: (ExtendedImageState state) {
//                 switch (state.extendedImageLoadState) {
//                   case LoadState.loading:
//                     return const CircularProgressIndicator.adaptive();
//                   case LoadState.completed:
//                     return state.completedWidget;
//                   case LoadState.failed:
//                     return Icon(
//                       Icons.error,
//                       color: Colors.red,
//                     );
//                 }
//               }
//           ),
//         ),
//       ),
//     );
//   }
// }
