import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/prodcust_card/product_card_vertical.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///DropDown
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              "Name",
              "Higher price",
              "Lower price",
              "Sale",
              "Newest",
              "Popularity"
            ]
                .map((option) => DropdownMenuItem(value:option,child: Text(option)))
                .toList(),
            onChanged: (value) {}),
        SizedBox(height: TSizes.spaceBtwSections),
        TGridLayout(itemsCount: 4, itemBuilder: (_,index) => TProductCardVertical())
      ],
    );
  }
}
