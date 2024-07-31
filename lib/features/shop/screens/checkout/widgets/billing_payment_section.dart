import 'package:e_commerce_app/utils/constants/consts.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ///subTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme
                .of(context)
                .textTheme
                .bodyMedium,),
            Text('\$256', style: Theme
                .of(context)
                .textTheme
                .bodyMedium,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Free', style: Theme
                .of(context)
                .textTheme
                .bodyMedium,),
            Text('\$6.0', style: Theme
                .of(context)
                .textTheme
                .labelLarge,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Free', style: Theme
                .of(context)
                .textTheme
                .bodyMedium,),
            Text('\$6.0', style: Theme
                .of(context)
                .textTheme
                .labelLarge,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme
                .of(context)
                .textTheme
                .bodyMedium,),
            Text('\$6.0', style: Theme
                .of(context)
                .textTheme
                .titleMedium,)
          ],
        )
      ],
    );
  }
}
