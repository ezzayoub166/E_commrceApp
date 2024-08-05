import 'dart:ffi';

import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/personlization/screens/chnage_single_filed/change_name.dart';
import 'package:e_commerce_app/features/personlization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

import '../../controllers/user_controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      if (controller.imageUploading.value) {
                        return TShimmerEffect(width: 80, height: 80);
                      } else {
                        return TCircularImage(
                          image: image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                            isNetworkImage: networkImage.isNotEmpty);
                      }
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: Text('Change Profile Picture'))
                  ],
                ),
              ),

              /// Details
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSectionHeader(
                  title: 'Profile Information', showActionButton: false),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () {
                  Get.to(() => ChangeName());
                },
              ),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onPressed: () {},
              ),

              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading Personal Info
              TSectionHeader(title: 'Personal Infromation'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                title: 'User Id',
                value: AuthenticationRepository.instance.authUser!.uid,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date Of Birth',
                value: '10 Oct, 2002',
                onPressed: () {},
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      controller.deleteAccountWarningPopup();
                    },
                    child: Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
