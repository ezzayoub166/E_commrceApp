
import 'package:e_commerce_app/utils/constants/consts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TCartItems(
                showAddRemoveButtons: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Coupon Textfiled
              TCouponCode(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Billing Section
              TRounderContainer(
                padding: EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: isDark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    ///Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///Payment method
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///Address
                   TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems,)

                  ],
                ),
              )
            ],
          ),
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(onPressed: (){
            Get.to(() => SuccessScreen(image: TImages.successfulPaymentIcon, title: 'Payment Success', subTitle: 'Your item will be shipped soon!', onPressed: (){
              Get.offAll(() => NavigationMenu());
}));
          }, child: Text('Check Out \$250.0')),
        )
    );
  }
}
