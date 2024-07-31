import '../../../utils/constants/consts.dart';

class TCircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? background;
  final VoidCallback? onPressed;

  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.background,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: background != null ? background : isDark
            ? TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed:onPressed, icon: Icon(icon , size: size, color: color,)),
    );
  }
}
