import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/personlization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(image: TImages.user , width: 80 , height:  80),
                    TextButton(onPressed: (){}, child: Text('Change Profile Picture'))
                  ],
                ),
              ),
              /// Details
              SizedBox(height: TSizes.spaceBtwItems / 2,) ,
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),
              TSectionHeader(title: 'Profile Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(title: 'Name', value: 'Coding With Izzdine', onPressed: () {  },),
              TProfileMenu(title: 'Username', value: 'coding_with_izzdine', onPressed: () {  },),

              SizedBox(height: TSizes.spaceBtwItems,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              /// Heading Personal Info
              TSectionHeader(title: 'Personal Infromation'),
              SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(title: 'User Id', value: '2531718', onPressed: () {  },icon: Iconsax.copy,),
              TProfileMenu(title: 'E-mail', value: 'codingIzzdine@gmail.com', onPressed: () {  },),
              TProfileMenu(title: 'Phone Number', value: '+972 592771918', onPressed: () {  },),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {  },),
              TProfileMenu(title: 'Date Of Birth', value: '10 Oct, 2002', onPressed: () {  },),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),
              Center(
                child: TextButton(onPressed: (){
                  AuthenticationRepository.instance.logout();
                }, child: Text('Close Account' , style: TextStyle(color: Colors.red ),)),
              )






            ],
        ),

        ),

      ),
    );
  }
}

