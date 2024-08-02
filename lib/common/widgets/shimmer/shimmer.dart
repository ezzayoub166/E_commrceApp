import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:shimmer/shimmer.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
       this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color ?? (isDark ? TColors.darkGrey : TColors.white)
          ),
        ),
        baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!);
  }
}
