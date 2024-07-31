import 'package:e_commerce_app/features/authenticaion/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/widgets/onboading_button.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/widgets/onboading_dot_navigation.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Horiznotal Scrollable Page

          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                  title: TTexts.onBoardingTitle1,
                  subtitle: TTexts.onBoardingSubTitle1,
                  image: TImages.onBoardingImage1),
              OnboardingPage(
                  title: TTexts.onBoardingTitle2,
                  subtitle: TTexts.onBoardingSubTitle2,
                  image: TImages.onBoardingImage2),
              OnboardingPage(
                  title: TTexts.onBoardingTitle3,
                  subtitle: TTexts.onBoardingSubTitle3,
                  image: TImages.onBoardingImage3),
            ],
          ),
          //Skip Button
          onBoardingSkip(),
          //Dot Navigation SmoothPageIndicator
          onBoardingDotNavigation(),
          //Circular Button
          OnBoardingNextButton()

        ],
      ),
    );
  }
}





