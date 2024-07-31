import 'package:e_commerce_app/features/authenticaion/screens/password_configuration/reset_password.dart';

import '../../../../utils/constants/consts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headlines
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle , style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: TSizes.spaceBtwSections * 2),

            ///Text Fileds
            TextFormField(
              decoration: InputDecoration(labelText: TTexts.email , prefixIcon: Icon(Iconsax.direct_right)),
            ),
            SizedBox(height: TSizes.spaceBtwSections),


            ///Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
              Get.off(() => ResetPassword());
            }, child: Text(TTexts.submit)),)

          ],
        ),

      ),
    );
  }
}
