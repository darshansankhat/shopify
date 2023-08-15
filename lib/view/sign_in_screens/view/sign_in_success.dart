import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInSuccess extends StatefulWidget {
  const SignInSuccess({super.key});

  @override
  State<SignInSuccess> createState() => _SignInSuccessState();
}

class _SignInSuccessState extends State<SignInSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height : 10.h),
                Icon(
                  Icons.task_alt_outlined,
                  color: Colors.green.withOpacity(0.9),
                  size: 80,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Successful!",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "You have successfully login and\nregister in our app. Now you can start\nworking on it.",
                  style: TextStyle(fontSize: 15, color: Colors.black38),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed("bottombar");
                    },
                    child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepOrange,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Start",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
