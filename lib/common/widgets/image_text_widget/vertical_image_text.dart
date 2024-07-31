import '../../../utils/constants/consts.dart';

class TVerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor ,
    this.onTap,
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
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: isDark ? TColors.light : TColors.dark,
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
