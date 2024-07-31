import 'package:e_commerce_app/common/widgets/sucess_screen/sucess_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/authenticaion/controllers/singup_controller/verify_controller.dart';
import 'package:e_commerce_app/features/authenticaion/screens/login/login.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/consts.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image.asset(
                TImages.deliveredEmailIllustration,
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Title & subtitle
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){ controller.checkEmailVerificationStatus();},
                      child: Text(TTexts.tContinue))),
              SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(), child: Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
