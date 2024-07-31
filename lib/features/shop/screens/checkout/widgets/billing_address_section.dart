import 'package:e_commerce_app/utils/constants/consts.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TSectionHeader(title: 'Shipping Address' ,buttonTitle: 'Chane',onPressed: (){},),
       Text('Coding with T',style: Theme.of(context).textTheme.bodyLarge,),
      SizedBox(height: TSizes.spaceBtwItems/2,),
      Row(
        children: [
          Icon(Icons.phone,  color: Colors.grey,size: 16,),
          SizedBox(width: TSizes.spaceBtwItems,),
          Text('+92-318 272723',style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
      SizedBox(height: TSizes.spaceBtwItems/2,),
      Row(
        children: [
          Icon(Icons.location_history,  color: Colors.grey,size: 16,),
          SizedBox(width: TSizes.spaceBtwItems,),
          Text('South Liana , Maine 87696, USA',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)
        ],
      ),
      SizedBox(height: TSizes.spaceBtwItems/2,),

    ],
  );
  }
}
