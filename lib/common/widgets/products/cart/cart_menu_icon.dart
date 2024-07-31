import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';

import '../../../../utils/constants/consts.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  });

  final Color? iconColor ;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){Get.to(() => CartScreen());}, icon: Icon(Iconsax.shopping_bag,color: iconColor,)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: TColors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white , fontSizeFactor:  0.8),),
            ),
          ),
        )

      ],
    );
  }
}
