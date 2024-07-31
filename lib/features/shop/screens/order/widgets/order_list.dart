import 'package:e_commerce_app/utils/constants/consts.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        separatorBuilder: (_,__) => SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_,index){
      return TRounderContainer(
        padding: EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: isDark ? TColors.dark :TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// -- Row 1
            Row(
              children: [
                /// 1-Icon
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.defaultSpace /2 ),
                /// 2 -status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                      Text('07 Nov 2024',style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
                /// 2 -Icon
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34,size: TSizes.iconSm,))
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems/2),
            /// -- Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1-Icon
                      Icon(Iconsax.tag),
                      SizedBox(width: TSizes.defaultSpace /2 ),
                      /// 2 -status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',style: Theme.of(context).textTheme.labelMedium,),
                            Text('#FR454',style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// 1-Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: TSizes.defaultSpace /2 ),
                      /// 2 -status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',style: Theme.of(context).textTheme.labelMedium,),
                            Text('03 Feb 2025',style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
