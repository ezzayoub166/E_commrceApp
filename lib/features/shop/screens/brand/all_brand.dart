import 'package:e_commerce_app/common/widgets/brand/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Heading 
            TSectionHeader(title: 'Brands'),
            SizedBox(height: TSizes.spaceBtwItems,),

            ///Brands
            TGridLayout(itemsCount: 4,mainAxisExtent:80 , itemBuilder: (contex,index) => TBrandCard(showBorder: true,onTap: (){Get.to(() => BrandProductsScreen());},))
          ],
        ),
        ),
      ),
    );
  }
}
