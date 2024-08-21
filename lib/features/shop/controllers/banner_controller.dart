import 'package:e_commerce_app/data/repositories/banner_repository.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/loader/laoders.dart';

class BannerController extends GetxController{

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }


  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  ///Load Banner Data
  Future<void> fetchBanners() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      this.banners.assignAll(banners);

      //final banners =
    } catch (eMessage) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: eMessage.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}