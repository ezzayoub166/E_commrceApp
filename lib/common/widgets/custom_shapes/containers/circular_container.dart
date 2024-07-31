import 'package:e_commerce_app/utils/constants/consts.dart';

class TCircularContainer extends StatelessWidget {

  final double? height ;
  final double? width;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child ;
  final Color background ;

  const TCircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400 ,
    this.padding = 0,
    this.child,
    this.background = TColors.white, this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: background
      ),
      child: child,
    );
  }
}
