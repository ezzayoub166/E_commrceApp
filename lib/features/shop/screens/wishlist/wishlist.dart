import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icon/t_cricular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/Home/home.dart';

import '../../../../utils/constants/consts.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text(
        'Wishlist',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        TCircularIcon(icon: Iconsax.add , onPressed: (){Get.to(const HomeScreen());},)
      ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemsCount: 4, itemBuilder: (_,index){
                return TProductCardVertical();
              })
            ],
          ),
        ),
      ),
    );
  }
}
