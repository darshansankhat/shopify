import 'package:get/get.dart';


class BottomController extends GetxController
{
  RxInt selectScreen = 0.obs;

  void changeScreen(int value)
  {
    selectScreen.value = value;
  }

}