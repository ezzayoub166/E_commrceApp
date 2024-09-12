import 'package:e_commerce_app/data/repositories/brand_repository.dart';
import 'package:e_commerce_app/data/repositories/product_repository.dart';
import 'package:e_commerce_app/features/personlization/controllers/user_controller/user_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/data/dummy_data.dart';
import '../../cart/cart_screen.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    //final productRepo = Get.put(ProductRepository());
    final brandRepo = Get.put(BrandRepository());
    return TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey),
            ),
            Obx((){
              if(controller.profileLoading.value){
                return TShimmerEffect(height: 15 ,width: 80 );
              }else{
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }

            }

            )
          ],
        ),
        showBackArrow: false,
        actions: [
          Obx(() {
            return brandRepo.isLoading.value
                ? const CircularProgressIndicator() // Show progress indicator
                : TCartCounterIcon(onPressed: () async{
              try {
                await brandRepo.uploadDummyData(TDummyData.brands);
              } catch (e) {
                print("Upload failed: $e");
              }

              // You can navigate to another screen or show a success message here
            });
          }),
        ],
        leadingPressed: () {});
  }
}
