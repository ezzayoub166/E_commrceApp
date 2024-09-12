import 'package:e_commerce_app/common/widgets/brand/brand_card.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Brand Detail
            TBrandCard(showBorder: true,brandModel:brand,),
            SizedBox(height: TSizes.spaceBtwSections,),
            FutureBuilder(future: brandController.getBrandProducts(brand.id), builder: (context,snapshot){
              //handel Loader , No Record , OR ERROR Message 
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
              if (widget != null) return widget;
              //Record Founds 
              final brandProducts = snapshot.data!;
              return TSortableProducts(products: brandProducts);
            })
          ],
        ),
        ),
      ),
    );
  }
}
