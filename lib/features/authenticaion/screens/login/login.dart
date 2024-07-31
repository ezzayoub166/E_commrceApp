
import '../../../../utils/constants/consts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo, Title & sub Title
              TLoginHeader(isDark: isDark),
              //Form
              TLoginForm(),
              SizedBox(height: TSizes.spaceBtwSections),
              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}




