// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/view/bottom_bar/controller/bottom_controller.dart';
import 'package:shopify/view/1home/view/home_screen.dart';
import 'package:shopify/view/2notification/view/notification_screen.dart';
import 'package:shopify/view/3bag/view/bag_screen.dart';
import 'package:shopify/view/4favorite/view/favorite_screen.dart';
import 'package:shopify/view/5profile/view/profile_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  BottomController controller = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
              index: controller.selectScreen.value,
              children: const [
                HomeScreen(),
                NotificationScreen(),
                BagScreen(),
                FavoriteScreen(),
                ProfileScreen(),
              ]),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Obx(
            () => BottomNavigationBar(
              onTap: (value) {
                controller.changeScreen(value);
              },
              currentIndex: controller.selectScreen.value,
              elevation: 0,
              // backgroundColor: Colors.amber,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
              unselectedItemColor: Colors.black38,
              unselectedLabelStyle: const TextStyle(color: Colors.amber),
              items: [
                buildBottomNavigationBarItem(
                    controller.selectScreen == 0
                        ? Icons.home
                        : Icons.home_outlined,
                    "Home"),
                buildBottomNavigationBarItem(
                    controller.selectScreen == 1
                        ? Icons.notifications
                        : Icons.notifications_outlined,
                    "Notification"),
                buildBottomNavigationBarItem(
                    controller.selectScreen == 2
                        ? Icons.shopping_bag
                        : Icons.shopping_bag_outlined,
                    "Bag"),
                buildBottomNavigationBarItem(
                    controller.selectScreen == 3
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    "Favorite"),
                buildBottomNavigationBarItem(
                    controller.selectScreen == 4
                        ? Icons.person
                        : Icons.person_outline_outlined,
                    "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
          IconData i1, String data) =>
      BottomNavigationBarItem(icon: Icon(i1,size: 27,), label: data);
}
