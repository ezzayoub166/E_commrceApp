import 'package:e_commerce_app/utils/constants/consts.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.homeAppbarTitle , style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
            Text(TTexts.homeAppbarSubTitle , style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)

          ],
        ) ,
        showBackArrow: false,
        actions: [
          TCartCounterIcon(onPressed: () {  }, iconColor: TColors.white,)
        ],
        leadingPressed: (){}
    );
  }
}
