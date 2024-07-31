
import 'package:e_commerce_app/utils/constants/consts.dart';

class TCartItems extends StatelessWidget {

  final bool showAddRemoveButtons;

  const TCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Column(
              children: [
                TCartItem(),
                if(showAddRemoveButtons) SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                ///Add Remove Buttons
                if(showAddRemoveButtons)  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: TDeviceUtils.getScreenWidth(context) /4.5),
                        TProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                    TProductPriceText(price: '253')
                  ],
                )
              ],
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          itemCount: 2),
    );
  }
}
