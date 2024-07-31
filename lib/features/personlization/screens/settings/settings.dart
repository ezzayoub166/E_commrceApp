import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/common/widgets/list_titles/settings_menu_title.dart';
import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/personlization/screens/address/address_screen.dart';
import 'package:e_commerce_app/features/personlization/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/features/shop/screens/order/orders_screen.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import '../../../../common/widgets/list_titles/user_prifle_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// User Profile Card
                TProfileUserTitle(onTap: (){
                  Get.to(() => ProfileScreen());
                },),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            )),

            /// --- Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// --- Account Settings
                  TSectionHeader(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set Shopping delivery Address',
                    onTap: () {
                      Get.to(() => UserAddressScreen());
                    },
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add,remove products and move to checkout',
                    onTap: () {
                      Get.to(() => CartScreen());
                    },
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () {
                      Get.to(()=>OrdersScreen());
                    },
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discount coupons',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.security_card,
                    title: 'Notification',
                    subTitle: 'Manage Data Usage and connected accounts',
                    onTap: () {},
                  ),

                  /// --- App Settings
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeader(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                      leadingIcon: Iconsax.document_cloud,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase'),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTitle(
                    leadingIcon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems,),


                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => AuthenticationRepository.instance.logout() ,
                        child: Text("Log Out")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
