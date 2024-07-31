import 'package:e_commerce_app/features/authenticaion/screens/login/login.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/consts.dart';

class SuccessScreen extends StatelessWidget {

  final String image , title , subTitle;

  final VoidCallback onPressed;

  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 1.2 ,
          child: Column(
           children: [
             ///Image
             Lottie.asset(image,
               width: THelperFunctions.screenWidth() * 0.6,
             ),
             SizedBox(height: TSizes.spaceBtwSections),

             ///Title & subtitle
             Text(title , style: Theme.of(context).textTheme.headlineMedium , textAlign: TextAlign.center),
             SizedBox(height: TSizes.spaceBtwItems),
             Text('support@codingwith.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
             SizedBox(height: TSizes.spaceBtwItems),
             Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
             SizedBox(height: TSizes.spaceBtwSections),

             //Button

             SizedBox(
               width: double.infinity,
               child: ElevatedButton(onPressed: onPressed, child: Text(TTexts.tContinue)),
             )
           ],
          ),
        ),
      ),
    );
  }
}
