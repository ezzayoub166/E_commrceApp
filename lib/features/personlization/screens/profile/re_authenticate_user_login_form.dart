import 'package:e_commerce_app/features/personlization/controllers/user_controller/user_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text("Re-authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems,),
                Obx(() => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: TValidator.validatePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                    ),
                    labelText: TTexts.password,
                  ),
                ),),
                SizedBox(height: TSizes.spaceBtwSections,),
                SizedBox(width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.reAuthenticateEmailAndPassword() ,
                  child: Text('Verify'),
                ),

                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
