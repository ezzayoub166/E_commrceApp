import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({super.key, this.title,  this.showBackArrow = false, this.leadingIcon,  this.actions,  this.leadingPressed});

  final Widget? title ;
  final bool showBackArrow ;
  final IconData? leadingIcon ;
  final List<Widget>? actions ;
  final VoidCallback? leadingPressed ;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.md) ,
    child: AppBar(
      automaticallyImplyLeading: false,
      actions: actions,
      leading: showBackArrow
          ? IconButton(onPressed: () => Get.back() , icon: Icon(Iconsax.arrow_left, color: isDark ? TColors.white : TColors.black,))
          : leadingIcon != null ? IconButton(onPressed: leadingPressed, icon: Icon(leadingIcon )) : null,
      title: title ,

    )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
