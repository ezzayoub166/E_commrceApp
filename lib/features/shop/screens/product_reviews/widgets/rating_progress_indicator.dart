import 'package:e_commerce_app/utils/constants/consts.dart';

class TRatingProgressIndicator extends StatelessWidget {

  final String text ;
  final double value;

  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex : 1,child: Text(text ,style:Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.8 ,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: TColors.grey,
              valueColor: AlwaysStoppedAnimation(TColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
