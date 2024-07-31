import 'package:e_commerce_app/features/shop/screens/order/widgets/order_list.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("My Orders",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      /// ---Orders
        child: TOrderListItems(),

      ),
    );
  }
}
