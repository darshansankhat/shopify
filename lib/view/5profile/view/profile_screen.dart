import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/firebase_helper.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top
              SizedBox(
                height: 60.sp,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "My profile",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              //image name
              SizedBox(
                height: 10.sp,
              ),
              ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                ),
                title: Text(
                  "Name",
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
                subtitle: const Text(
                  "@gmail.com",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: SizedBox(
                  height: 20.sp,
                  width: 65.sp,
                  child: ElevatedButton(
                    onPressed: () {
                      FireBaseHelper.fireBaseHelper.signOut();
                      Get.offAllNamed("signin");
                    },
                    child: const Text("SignOut"),
                  ),
                ),
              ),
              //my orders
              SizedBox(
                height: 15.sp,
              ),
              buildListTile("My orders", "Already new 12 orders"),
              Divider(
                height: 2,
                color: Colors.black12.withOpacity(0.05),
              ),
              buildListTile("Shipping addresses", "3 addresses"),
              Divider(
                height: 2,
                color: Colors.black12.withOpacity(0.05),
              ),
              buildListTile("Payment methods", "Visa ..34"),
              Divider(
                height: 2,
                color: Colors.black12.withOpacity(0.05),
              ),
              buildListTile("Promocodes", "You have special promocodes"),
              Divider(
                height: 2,
                color: Colors.black12.withOpacity(0.05),
              ),
              buildListTile("My reviews", "Reviews for 4 times"),
              Divider(
                height: 2,
                color: Colors.black12.withOpacity(0.05),
              ),
              buildListTile("Settings", "Notification, password"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListTile(String title, String subTitle) {
    return SizedBox(
      height: 50.sp,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
        ),
      ),
    );
  }
}
