import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';

import '../../../utils/constants/consts.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key,  this.itemCount = 6});
  final int itemCount ;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemsCount: itemCount,
          itemBuilder: (_,__) => SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start
              ,children: [
              ///Image
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: TSizes.spaceBtwItems,),
              ///Text
              TShimmerEffect(width: 160, height:15),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              TShimmerEffect(width: 160, height:15),
            ],
            ),
          )
    );
  }
}
