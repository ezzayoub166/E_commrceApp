import 'package:e_commerce_app/features/authenticaion/controllers/login_controller/login_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';


class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image:AssetImage(TImages.google)),
          ),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: (){},
            icon: Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image:AssetImage(TImages.facebook)),
          ),
        ),

      ],
    );
  }
}
