import 'package:e_commerce_app/features/personlization/controllers/update_name_controller/update_name_controller.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(

      appBar: TAppBar(showBackArrow: true,title: Text("Change Name" , style: Theme.of(context).textTheme.headlineSmall,),),
      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text('Use Real name for easy verification. This name will appear on servel pages.'
            ,style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections,),
            Form(
              key: controller.keyForChangeName,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.fName,
                  validator: (value) => TValidator.validateEmptyText('First Name', value!),
                  expands: false,
                  decoration: InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                ),
                SizedBox(height: TSizes.spaceBtwItems,),
                TextFormField(
                  controller: controller.lName,
                  validator: (value) => TValidator.validateEmptyText('Last Name', value!),
                  expands: false,
                  decoration: InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                )
              ],
            )),
            SizedBox(height: TSizes.spaceBtwSections,),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: ()=> controller.updateUserName() ,
                  child: Text(
                 "Save",
              ),
              style: OutlinedButton.styleFrom(foregroundColor: TColors.white , backgroundColor: TColors.primary),
              ),
            )

          ],
        ),

      ) ,
    );
  }
}
