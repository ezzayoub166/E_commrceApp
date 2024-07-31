import 'dart:io';

import 'package:e_commerce_app/data/repositories/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void> main() async{
   final WidgetsBinding widgetsBinding =   WidgetsFlutterBinding.ensureInitialized();
   /// GetX local Storage
   await GetStorage.init();
   /// Await splash until other items loaded
   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
   if(Platform.isAndroid){
      await Firebase.initializeApp(
         options: FirebaseOptions(
            apiKey: 'AIzaSyBRC7EJDQ60uJI5zyMPW26cmCCcANfEyaM', // paste your api key here
            appId: '1:275379182900:android:f074c3cebfc47f28d79961', //paste your app id here
            messagingSenderId: '275379182900', //paste your messagingSenderId here
            projectId: 'e-commcre-app', //paste your project id here
         ),
      ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
   }else{
      await Firebase.initializeApp().then((FirebaseApp value) => Get.put(AuthenticationRepository()));
   }


   runApp(App());

}
