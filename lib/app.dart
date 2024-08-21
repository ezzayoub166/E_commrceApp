import 'package:e_commerce_app/bindings/GeneralBindings.dart';
import 'package:e_commerce_app/features/authenticaion/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:e_commerce_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme:TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: OnboardingScreen()
    );
  }
}