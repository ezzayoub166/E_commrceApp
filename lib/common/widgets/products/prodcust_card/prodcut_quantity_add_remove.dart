import 'package:e_commerce_app/common/widgets/icon/t_cricular_icon.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color:  THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
          background: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.grey,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color:  THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
          background: THelperFunctions.isDarkMode(context)
              ? TColors.primary
              : TColors.grey,
        ),
      ],
    );
  }
}
