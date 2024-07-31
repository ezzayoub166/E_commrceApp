import '../../../utils/constants/consts.dart';

class TSettingsMenuTitle extends StatelessWidget {
  const TSettingsMenuTitle({super.key, required this.leadingIcon, required this.title, required this.subTitle, this.trailing, this.onTap});

  final IconData leadingIcon ;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(leadingIcon,size: 28, color: TColors.primary),
      title:Text(title , style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle ,style: Theme.of(context).textTheme.labelMedium,),
      trailing:trailing ,
      onTap: onTap,
    );
  }
}
