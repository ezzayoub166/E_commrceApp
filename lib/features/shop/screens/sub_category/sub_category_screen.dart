import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_horziontal.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              TRoundedImage(
                imageUrl: TImages.banner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sub Catgeroies
              Column(
                children: [
                  ///Heading
                  TSectionHeader(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                      height: 120,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => TProductCardHorizontal(),
                          separatorBuilder: (_, __) => SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
                          itemCount: 4))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
