import 'package:e_commerce_app/features/authenticaion/screens/login/login.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authenticaion/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authenticaion/screens/signup/signup.dart';
import 'package:e_commerce_app/features/personlization/screens/address/address_screen.dart';
import 'package:e_commerce_app/features/personlization/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/features/personlization/screens/settings/settings.dart';
import 'package:e_commerce_app/features/shop/screens/Home/home.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout_screen.dart';
import 'package:e_commerce_app/features/shop/screens/order/orders_screen.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.store, page: () => StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => WishlistScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    GetPage(name: TRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => OrdersScreen()),
    GetPage(name: TRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: TRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: TRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: TRoutes.signUp, page: () => SignupScreen()),
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => OnboardingScreen()),

  ];
}