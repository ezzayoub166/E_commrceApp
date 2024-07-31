import 'package:e_commerce_app/common/widgets/app_bar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounder_container.dart';
import 'package:e_commerce_app/features/personlization/screens/address/add_new_address.dart';
import 'package:e_commerce_app/features/personlization/screens/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNewAddressScreen());
        },
        backgroundColor: TColors.primary,
        child: Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSingleAddress(selectedAddress: true),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),



          ],
        ),

        ),
      ),
    );
  }
}
