import 'package:e_commerce_app/utils/constants/consts.dart';


class OnboardingPage extends StatelessWidget {
  final String title, image, subtitle;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Lottie.asset(image,
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.6),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
