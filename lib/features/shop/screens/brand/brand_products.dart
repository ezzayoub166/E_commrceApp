import 'package:e_commerce_app/common/widgets/brand/brand_card.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Brand Detail
            TBrandCard(showBorder: true),
            SizedBox(height: TSizes.spaceBtwSections,),
            TSortableProducts(),
          ],
        ),
        ),
      ),
    );
  }
}
