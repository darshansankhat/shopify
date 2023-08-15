import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/firebase_helper.dart';
import 'package:shopify/view/1home/model/home_model.dart';
import 'package:sizer/sizer.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  // String image="";
  // String name="";
  // String subname="";
  // String price="";

  HomeModel? h1;

  @override
  void initState() {
    super.initState();
    h1 = Get.arguments;
    // image=h1.image;
    // name=h1.name;
    // subname = h1.subname;
    // price = h1.price;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                //top
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Name",
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //image
                Container(
                  height: 78.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: SizedBox(
                    height: 78.h,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // image
                          Container(
                            height: 50.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${h1!.image}"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // filter
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //size
                                    buildContainer("Size"),
                                    // color
                                    buildContainer("Black"),
                                    //like
                                    Container(
                                      height: 5.h,
                                      width: 10.w,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 5,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: const Icon(
                                        Icons.favorite_border_rounded,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                // name price
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${h1!.name}",
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    ),
                                    Text(
                                      "₹ ${h1!.price}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.deepOrange),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${h1!.subname}",
                                  style: const TextStyle(color: Colors.black38),
                                ),
                                //rating
                                SizedBox(
                                  height: 1.h,
                                ),
                                const Text("⭐⭐⭐⭐⭐ (10)"),
                                //description
                                SizedBox(
                                  height: 1.h,
                                ),
                                const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //Add to cart
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      HomeModel h2 = HomeModel(
                          image: h1!.image,
                          name: h1!.name,
                          subname: h1!.subname,
                          price: h1!.price);
                      FireBaseHelper.fireBaseHelper.addToCart(h2);
                      Get.back();
                    },
                    child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepOrange,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "ADD TO CART",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                //new
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "You can also like this",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(fontSize: 15, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                //sale item
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 32.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return newItem();
                      },
                      itemCount: 5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(data) {
    return Container(
      height: 5.h,
      width: 35.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$data",
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

Widget newItem() {
  return Container(
    height: 32.h,
    width: 35.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Container(
              height: 20.h,
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              alignment: const Alignment(1, 1.3),
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            //rating
            const Text(
              "⭐⭐⭐⭐⭐",
            ),
            //name
            const Text(
              "Name",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            //sub name
            const Text(
              "Sub name",
              style: TextStyle(fontSize: 13, color: Colors.black38),
            ),
            //price
            const Text(
              "\$200",
              style: TextStyle(fontSize: 13, color: Colors.deepOrange),
            ),
            SizedBox(
              height: 0.2.h,
            ),
          ],
        )
      ],
    ),
  );
}
