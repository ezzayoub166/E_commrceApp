import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/all_products_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.title, this.query, this.featureMethod});

  final String title ;
  final Query? query;
  final Future<List<ProductModel>>? featureMethod;

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
              //check the state of the future builder snapshot
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,loader: loader);
              if(widget != null )return widget;

              final products = snapshot.data!;
              return  TSortableProducts(products: products,);
            }
          ),
        ),
      ),
    );
  }
}

