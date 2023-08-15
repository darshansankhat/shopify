import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/firebase_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  // var txtkey = GlobalKey<>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //top
                  SizedBox(
                    height: 7.h,
                  ),
                  Image.asset(
                    "assets/images/shopify.png",
                    height: 7.h,
                  ),
                  // Container(
                  //   height: 15.h,
                  //   width: 100.w,
                  //   alignment: Alignment.center,
                  //   child: Image.asset("assets/images/shopify.png",fit: BoxFit.fill,),
                  //   child: Text(
                  //     "Sign In",
                  //     style: TextStyle(
                  //         fontSize: 35,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  //email
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              offset: Offset(0, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        validator: (value) {
                          return "Please enter the email";
                        },
                        controller: txtemail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Email"),
                        ),
                      ),
                    ),
                  ),
                  //password
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              offset: Offset(0, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        validator: (value) {
                          return "Please enter the password";
                        },
                        controller: txtpassword,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Password"),
                        ),
                      ),
                    ),
                  ),
                  //forget
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Forget your password? ->")),
                  ),
                  //signin
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () async {
                      String msj = await FireBaseHelper.fireBaseHelper
                          .signInEmail(txtemail.text, txtpassword.text);
                      if (msj == "SignIn Successfully") {
                        Get.offAllNamed("signinsuccess");
                        Get.snackbar("", "$msj",
                            colorText: Colors.black,
                            backgroundColor: Colors.blue.shade50);
                      } else {
                        Get.snackbar("", "$msj",
                            colorText: Colors.black,
                            backgroundColor: Colors.redAccent);
                      }
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
                        "Sign In",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  //other
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("or sign in with social account"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //google
                      FloatingActionButton(
                        heroTag: "1",
                        onPressed: () async {
                          await FireBaseHelper.fireBaseHelper.signInGoogle();
                          Get.toNamed("signinsuccess");
                        },
                        child: Image.asset(
                          "assets/images/g.png",
                          height: 30,
                          width: 30,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      //facebook
                      FloatingActionButton(
                        onPressed: () async {
                          // await FireBaseHelper.fireBaseHelper.signInFacebook();
                          // Get.toNamed("signinsuccess");
                        },
                        heroTag: "2",
                        child: Image.asset(
                          "assets/images/f.png",
                          height: 30,
                          width: 30,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      //guest
                      FloatingActionButton(
                        onPressed: () async {
                          String msj =
                              await FireBaseHelper.fireBaseHelper.guestSignIn();
                          if (msj == "SignIn Successfully") {
                            Get.toNamed("signinsuccess");
                            Get.snackbar("", "$msj",
                                colorText: Colors.black,
                                backgroundColor: Colors.blue.shade50);
                          } else {
                            Get.snackbar("", "$msj",
                                colorText: Colors.black,
                                backgroundColor: Colors.blue.shade50);
                          }
                        },
                        heroTag: "3",
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  // sign up
                  SizedBox(
                    height: 11.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No have any account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("signup")!.then(
                            (value) {
                              txtemail.clear();
                              txtpassword.clear();
                            },
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
