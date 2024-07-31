import 'package:e_commerce_app/features/authenticaion/controllers/singup_controller/signup_controller.dart';
import 'package:e_commerce_app/features/authenticaion/screens/signup/verfity_email.dart';
import 'package:e_commerce_app/features/authenticaion/screens/signup/widgets/terms_and_conditions_checkBox.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';

import '../../../../../utils/constants/consts.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    validator: (value) => TValidator.validateEmptyText(
                      'First Name',
                      controller.firstName.text,
                    ),
                    controller: controller.firstName,
                    decoration: InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                TSizes.spaceBtwInputFields.widthBox,
                Expanded(
                  child: TextFormField(
                    validator: (value) => TValidator.validateEmptyText(
                      'last Name',
                      controller.lastName.text,
                    ),
                    controller: controller.lastName,
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                )
              ],
            ),
            TSizes.spaceBtwInputFields.heightBox,

            ///user name
            TextFormField(
              expands: false,
              validator: (value) => TValidator.validateEmptyText(
                'User Name',
                controller.userName.text,
              ),
              controller: controller.userName,
              decoration: InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            TSizes.spaceBtwInputFields.heightBox,

            ///Email

            TextFormField(
              expands: false,
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(
                controller.email.text,
              ),
              decoration: InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            TSizes.spaceBtwInputFields.heightBox,

            ///Phone Number
            TextFormField(
              expands: false,
              validator: (value) => TValidator.validatePhoneNumber(
                controller.phoneNumber.text,
              ),
              controller: controller.phoneNumber,
              decoration: InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            TSizes.spaceBtwInputFields.heightBox,

            ///Password
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(
                  controller.password.text,
                ),
                expands: false,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value)),
              ),
            ),

            TSizes.spaceBtwSections.heightBox,

            ///Term&Conditions checkbox
            TermsAndConditionsCheckBox(),
            TSizes.spaceBtwSections.heightBox,

            ///Signup Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                child: TTexts.createAccount.text.make(),
              ),
            )
          ],
        ));
  }
}
