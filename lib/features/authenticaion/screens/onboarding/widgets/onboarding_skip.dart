import 'package:e_commerce_app/features/authenticaion/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TDeviceUtils.getAppBarHeight() , right: TSizes.defaultSpace,child: TextButton(child: Text('Skip'), onPressed: ()=> OnboardingController.instance.skipPage()));
  }
}
