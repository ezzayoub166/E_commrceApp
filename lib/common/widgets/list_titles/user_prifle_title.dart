import 'package:e_commerce_app/utils/constants/consts.dart';


class TProfileUserTitle extends StatelessWidget {
  const TProfileUserTitle({
    super.key, this.onTap,
  });

  final VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(image: TImages.user ,
        width: 50,
        height: 50,
        padding: EdgeInsets.zero,
      ),
      title: Text('Coding With Ezz' , style: Theme.of(context).textTheme.headlineSmall!.apply(color:Colors.white),),
      subtitle: Text('ezzdine44@gmail.com' , style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: (){},icon: Icon(Iconsax.edit , color: TColors.white,),),
      onTap: onTap,
    );
  }
}
