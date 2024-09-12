import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key, this.itemsCount = 4});

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        mainAxisExtent: 80,
        itemsCount: itemsCount,
        itemBuilder: (_, __) => TShimmerEffect(width: 300, height: 80));
  }
}
