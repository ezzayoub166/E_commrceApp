
import 'package:e_commerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/sub_category/sub_category_screen.dart';

import '../../../../../utils/constants/consts.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      (){
        if(categoryController.isLoading.value) return TCategorySimmer();
          if(categoryController.featuredCategories.isEmpty){
            return Center(child: Text('No Data Found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),));
          }
        return SizedBox(
        height: 80,
        child: ListView.builder(
            itemCount: categoryController.featuredCategories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                onTap: (){
                  Get.to(() => SubCategoryScreen());
                },
                image: category.image,
                title: category.name,

              );
            }),
      );}
    );
  }
}
