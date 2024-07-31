import 'package:e_commerce_app/features/authenticaion/controllers/singup_controller/signup_controller.dart';

import '../../../../../utils/constants/consts.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        TSizes.spaceBtwItems.widthBox,
        Expanded(
          child: Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: '${TTexts.iAgreeTo} ' , style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '${TTexts.privacyPolicy} ' , style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: isDark ? TColors.white : TColors.primary
                    )),
                    TextSpan(text: '${TTexts.and} ' , style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '${TTexts.termsOfUse}' , style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: isDark ? TColors.white : TColors.primary
                    )),

                  ]
              )),
        )
      ],
    );
  }
}
