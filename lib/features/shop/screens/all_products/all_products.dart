import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/features/shop/controllers/all_products_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.title, this.query, this.featureMethod});

  final String title ;
  final Query? query;
  final Future<Object>? featureMethod;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: featureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              return TSortableProducts();
            }
          ),
        ),
      ),
    );
  }
}

