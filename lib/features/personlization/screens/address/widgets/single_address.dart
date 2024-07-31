import '../../../../../common/widgets/custom_shapes/containers/rounder_container.dart';
import '../../../../../utils/constants/consts.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});


  final bool selectedAddress ;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRounderContainer(
      width: double.infinity,
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent ,
      borderColor: selectedAddress ? Colors.transparent : isDark ? TColors.darkGrey : TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? isDark ? TColors.light : TColors.dark : null ,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe',
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: TSizes.sm / 2,),
              Text('(+123 456 7890))',maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: TSizes.sm / 2,),
              Text('82382 Timmy Coves , South Liana, Maine ,2323, USA',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Theme.of(context).textTheme.titleLarge,
              ),


            ],
          )
        ],
      ),
    );
  }
}
