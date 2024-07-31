import 'package:e_commerce_app/utils/constants/consts.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(child: Container(
      color: TColors.primary,
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
              top: -150 ,
              right: -250,
              child: TCircularContainer(background: TColors.textWhite.withOpacity(0.1))),
          Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(background: TColors.textWhite.withOpacity(0.1),)),
          child
        ],
      ),

    ),);
  }
}
