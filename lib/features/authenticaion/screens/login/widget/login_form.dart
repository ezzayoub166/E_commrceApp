import 'package:e_commerce_app/features/authenticaion/controllers/login_controller/login_controller.dart';
import 'package:e_commerce_app/features/authenticaion/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authenticaion/screens/signup/signup.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) =>
                  TValidator.validateEmptyText('Password', value!),
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  )),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields / 2),

          ///Remember me & Forgot password..
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Remember me
              Row(
                children: [
                  Obx(
                        () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        }),
                  ),
                  Text(TTexts.rememberMe)
                ],
              ),

              ///forget password
              TextButton(
                  onPressed: () {
                    Get.to(() => ForgetPassword());
                  },
                  child: Text(TTexts.forgetPassword))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections),

          ///Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  controller.emailAndPasswordSignIn();
                },
                child: Text(TTexts.signIn)),
          ),

          ///Create Account Button
          SizedBox(height: TSizes.spaceBtwItems),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  Get.to(SignupScreen());
                },
                child: Text(TTexts.createAccount)),
          )
        ],
      ),
    );
  }
}
