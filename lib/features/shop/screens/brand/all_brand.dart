import 'package:e_commerce_app/common/widgets/brand/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/common/widgets/shimmer/brand_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              TSectionHeader(title: 'Brands'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Brands
              Obx(() {
                if (brandController.isLoading.value) return TBrandShimmer();
                if (brandController.featuredBrands.isEmpty) {
                  return Center(
                    child: Text("Not Found",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)),
                  );
                }
                return TGridLayout(
                    itemsCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, int index) {
                      final brand = brandController.allBrands[index];
                      return TBrandCard(
                        showBorder: false,
                        brandModel: brand,
                        onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
