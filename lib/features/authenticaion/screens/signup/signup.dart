import 'package:e_commerce_app/features/authenticaion/screens/signup/widgets/signup_form.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/constants/consts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              TSignupForm(),
              ///Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!,),
              SizedBox(height: TSizes.spaceBtwSections),
              ///social Buttons
              TSocialButtons(),

              //
            ],
          ),
        ),
      ),
    );
  }
}

