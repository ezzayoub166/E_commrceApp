import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/features/shop/controllers/product/variations_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';

import '../../../../../utils/constants/consts.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    var controller = Get.put(VariationsController());
    return Obx(
        () => Column(
        children: [
          /// selected attributes Pricing & Description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty) TRounderContainer(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: isDark ? TColors.darkGrey : TColors.grey,
              child: Column(
                children: [
                  ///Title price & Stock status
                  Row(
                    children: [
                      TSectionHeader(title: 'Variation',showActionButton: false,),
                      SizedBox(width: TSizes.spaceBtwItems,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              TProductTitleText(
                                title: 'Price',
                                smallSize: true,
                              ),
                              ///Actual price
                              if(controller.selectedVariation.value.scalePrice > 0)
                               Text(
                                '\$${controller.getVariationPrice()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),

                              ///Sale Price
                              TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),

                          ///Stack
                          Row(
                            children: [
                              TProductTitleText(
                                title: 'Stock',
                                smallSize: true,
                              ),
                              SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
                              Text(
                                controller.variationsStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  /// Variation Descreption
                  TProductTitleText(
                    title:
                        controller.selectedVariation.value.description?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeader(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected =
                                  controller.selectedAttributes[attribute.name] ==
                                      attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariation!, attribute.name!)
                                  .contains(attributeValue);
                              return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList()),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
