// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';

class HomeController extends GetxController
{

  RxBool like = false.obs;

  List imgList = [
    "assets/images/slider/1.png",
    "assets/images/slider/2.png",
    "assets/images/slider/3.png",
    "assets/images/slider/4.png",
    "assets/images/slider/5.png",
  ];

  void favorite()
  {
    if(like==false)
      {
        like.value=true;
      }
    else if(like==true)
      {
        like.value=false;
      }
  }
}