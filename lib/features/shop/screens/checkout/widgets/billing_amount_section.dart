import 'package:e_commerce_app/utils/constants/consts.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeader(title: 'Payment method ', buttonTitle: 'Change' ,  onPressed: (){},),
        SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            TRounderContainer(
              height: 35,
              width: 60,
              // backgroundColor: isDark ? TColors.light : TColors.dark,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(TImages.paypal ,),fit: BoxFit.contain,),
            ),
            SizedBox(width: TSizes.spaceBtwItems/2,),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )

      ],
    );
  }
}
