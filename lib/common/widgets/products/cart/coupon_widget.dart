import 'package:e_commerce_app/utils/constants/consts.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRounderContainer(
      showBorder: true,
      backgroundColor: isDark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(
          top: TSizes.sm,
          bottom: TSizes.sm,
          right: TSizes.sm,
          left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),

          ///Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: isDark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      side: BorderSide(color: Colors.grey.withOpacity(0.1),)
                  ),
                  onPressed: () {}, child: Text('Apply')))
        ],
      ),
    );
  }
}
