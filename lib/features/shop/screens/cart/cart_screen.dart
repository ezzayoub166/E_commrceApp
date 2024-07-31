import 'package:e_commerce_app/features/shop/screens/checkout/checkout_screen.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: TCartItems(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){
          Get.to(() => CheckoutScreen());
        }, child: Text('Check Out \$250.0')),
      ),
    );
  }
}


