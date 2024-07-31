import 'package:e_commerce_app/features/authenticaion/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = OnboardingController.instance;

    final isDark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25.0,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigate,

        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: isDark ? TColors.light : TColors.dark , dotHeight: 6),
      ),
    );
  }
}