import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/home_controller.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/consts.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
     return Obx((){
       if (controller.isLoading.value) return TShimmerEffect(width: double.infinity, height: 190);

       //No Data found
       if(controller.banners.isEmpty){
         return Center(child: Text('No Data Fount!'),);
       }else {
         return Column(
           children: [
             CarouselSlider(items: controller.banners.map((banner) =>
                 TRoundedImage(imageUrl: banner.imageUrl,
                   isNetworkImage: true,
                   onPressed: () => Get.toNamed(banner.targetScreen),))
                 .toList(),
               options: CarouselOptions(
                   viewportFraction: 0.8,
                   onPageChanged: (index, _) =>
                       controller.updatePageIndicator(index)
               ),

             ),
             SizedBox(height: TSizes.spaceBtwItems),
             Center(
               child: Obx(() =>
                   Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       for (int i = 0; i < controller.banners.length; i++)
                         TCircularContainer(
                           width: 20,
                           height: 4,
                           margin: EdgeInsets.only(right: 10),
                           background: controller.carousalCurrentIndex.value ==
                               i ? TColors.primary : Colors.grey,
                         ),
                     ],
                   )),
             )
           ],
         );
       }
     });
  }
}
