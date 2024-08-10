import 'package:e_commerce_app/data/repositories/category_repository.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  ///Load Category Data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;
      //fetch categories from data source(Firebase , Api).
      final categories = await _categoryRepository.getAllCategories();
      //Update the categories list
      allCategories.assignAll(categories);
      //Filter featured categories
      featuredCategories.assignAll(categories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (eMessage) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: eMessage.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }

  ///Load selected category data
  ///Get Category or sub Category Products

}
