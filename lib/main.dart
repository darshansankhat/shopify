import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/view/add_to_cart/view/add_to_cart_screen.dart';
import 'package:shopify/view/bottom_bar/view/bottom_bar_screen.dart';
import 'package:shopify/view/sign_in_screens/view/sign_in_screen.dart';
import 'package:shopify/view/sign_in_screens/view/sign_in_success.dart';
import 'package:shopify/view/sign_in_screens/view/sign_up_screen.dart';
import 'package:shopify/view/splash/view/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "splash",
        routes: {
          "splash":(p0) => SplashScreen(),
          "signin":(p0) => SignInScreen(),
          "signup":(p0) => SignUpScreen(),
          "signinsuccess":(p0) => SignInSuccess(),
          "bottombar":(p0) => BottomBarScreen(),
          "addtocart":(p0) => AddToCartScreen(),
        },

        theme: ThemeData(useMaterial3: true),

      ),
    ),
  );
}
