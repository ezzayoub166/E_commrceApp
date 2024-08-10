import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class TCategorySimmer extends StatelessWidget {
  const TCategorySimmer({super.key,  this.itemCount = 6});
  final int itemCount ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_,__) => Column(
            crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
              ///Image 
             TShimmerEffect(width: 55, height: 55,radius: 55,),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            ///Text 
            TShimmerEffect(width: 55, height: 8)
            ],
          )
          , separatorBuilder: (_,__) => SizedBox(width: TSizes.spaceBtwItems,), itemCount: itemCount),
    );
  }
}
