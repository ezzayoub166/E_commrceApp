import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/features/shop/controllers/home_controller.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/consts.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
              viewportFraction: 0.8,
            onPageChanged: (index , _) => controller.updatePageIndicator(index)
          ),

        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(() => Row(
            mainAxisSize: MainAxisSize.min ,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                  width: 20,
                  height: 4,
                  margin: EdgeInsets.only(right: 10),
                  background: controller.carousalCurrentIndex.value == i ? TColors.primary : Colors.grey,
                ),
            ],
          )),
        )
      ],
    );
  }
}
