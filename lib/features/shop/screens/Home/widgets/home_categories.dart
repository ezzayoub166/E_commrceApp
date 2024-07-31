
import 'package:e_commerce_app/features/shop/screens/sub_category/sub_category_screen.dart';

import '../../../../../utils/constants/consts.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(
              onTap: (){
                Get.to(() => SubCategoryScreen());
              },
              image: TImages.sportIcon,
              title: 'Shoes',);
          }),
    );
  }
}
