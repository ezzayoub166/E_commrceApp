import '../../../utils/constants/consts.dart';

class TGridLayout extends StatelessWidget {
  final int itemsCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  const TGridLayout({
    super.key,
    required this.itemsCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemsCount,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
