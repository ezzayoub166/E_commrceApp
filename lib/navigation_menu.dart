import 'package:e_commerce_app/features/personlization/screens/settings/settings.dart';
import 'package:e_commerce_app/features/shop/screens/Home/home.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white ,
          indicatorColor:  darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),


          ],

        ),
      ),
      body:  Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
class NavigationMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen()

  ];
}