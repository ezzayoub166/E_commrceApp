import 'package:e_commerce_app/features/authenticaion/controllers/forgetPassword_controller/forget_password_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/sucess_screen/sucess_screen.dart';
import '../../../../utils/constants/consts.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {

  final String email ;
  const ResetPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
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

              Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwItems,),
              ///Title & subtitle
              Text(TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => LoginScreen());

                      },
                      child: Text(TTexts.done))),
              SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                      child: Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
