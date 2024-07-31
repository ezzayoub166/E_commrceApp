import 'package:e_commerce_app/features/authenticaion/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child:ElevatedButton(onPressed: () => OnboardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(shape: CircleBorder() , backgroundColor:isDark ? TColors.primary :  Colors.black),
            child:Icon(Iconsax.arrow_right_3)
        ));
  }
}
