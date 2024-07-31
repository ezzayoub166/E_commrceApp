import 'package:e_commerce_app/utils/constants/consts.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(
              (isDark ? TImages.lightAppLogo : TImages.darkAppLogo),
            )),
        Text(TTexts.loginTitle ,style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle , style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
