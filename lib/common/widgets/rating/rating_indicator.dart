import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TRatingBarIndicator extends StatelessWidget {

  final double rating ;

  const TRatingBarIndicator({
    super.key, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: TColors.grey,
        itemBuilder: (_,__) => Icon(Iconsax.star1 , color: TColors.primary,));
  }
}