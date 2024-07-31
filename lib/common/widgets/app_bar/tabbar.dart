import '../../../utils/constants/consts.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const TTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? TColors.black : TColors.white ,
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkGrey,
          labelColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.primary,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
