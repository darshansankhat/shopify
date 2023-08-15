import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/firebase_helper.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool user = false;

  @override
  void initState() {
    super.initState();
    user = FireBaseHelper.fireBaseHelper.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        if (user == false) {
          Get.offAllNamed("signin");
        } else {
          Get.offAllNamed("bottombar");
        }
      },
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 220.sp,
              ),
              Image.asset(
                "assets/images/shopify.png",
                height: 80.sp,
                width: 180.sp,
              ),
              Text(
                "Welcome to shopify store ",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 230.sp,
              ),
              Text(
                "from",
                style: TextStyle(color: Colors.black38),
              ),
              Text(
                "𝓓𝓪𝓻𝓼𝓱𝓪𝓷",
                style: TextStyle(fontSize: 30, color: Colors.deepOrange),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: LinearProgressIndicator(color: Colors.deepOrange,backgroundColor: Colors.deepOrange.shade200,),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
