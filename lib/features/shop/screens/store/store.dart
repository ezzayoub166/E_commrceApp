import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/common/widgets/app_bar/tabbar.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/category_tab.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../utils/constants/consts.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: TColors.black,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxInScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: isDark ? TColors.black : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          /// Search Bar
                          SizedBox(height: TSizes.spaceBtwItems),
                          TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(height: TSizes.spaceBtwSections),

                          /// Featured Brands
                          TSectionHeader(
                            title: 'Featured Brands ',
                            onPressed: () {},
                          ),
                          SizedBox(height: TSizes.spaceBtwItems / 1.5),

                          TGridLayout(
                              itemsCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, int index) {
                                return TBrandCard(showBorder: false,);
                              })
                        ],
                      ),
                    ),

                    /// Tabs ---
                    bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                    ))
              ];
            },
            body: TabBarView(
                children:  categories.map((category) => CategoryTab(category: category)).toList()
            
            )),
      ),
    );
  }
}






